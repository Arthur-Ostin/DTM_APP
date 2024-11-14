//
//  Draggable.swift
//  DTM
//
//  Created by Code Whiz on 11/12/24.
//

import SwiftUI
import PhotosUI

#Preview{
    Onboard9()
}

struct DraggableImageView: View {
    let image: String
    @Binding var arrImages: [String?]
    @Binding var draggingImage: String?
    @Binding var uploadedImageCount: Int
    @State private var isEditingImage = false // State to control the sheet presentation
    
    private let targetSize = CGSize(width: 90, height: 90)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                if let imageData = imageData(), let uiImage = UIImage(data: imageData) {
                    // Display the selected image
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: targetSize.width, height: targetSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // Display a smaller repick icon at the top right corner
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                // Open image editor view when repick is tapped
                                isEditingImage = true
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 16, height: 16) // Smaller size
                                    
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black)
                                        .frame(width: 10, height: 10) // Smaller icon
                                }
                            }
                            .padding([.top, .trailing], 4)
                        }
                        Spacer()
                    }
                } else {
                    // Default placeholder image
                    Image("photoInput")
                        .resizable()
                        .frame(width: targetSize.width, height: targetSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .draggable(image) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear {
                        draggingImage = image
                    }
            }
            .dropDestination(for: String.self) { item, location in false }
            isTargeted: { status in
                if let draggingImage = draggingImage, status, draggingImage != image {
                    rearrangeImages(draggingImage: draggingImage)
                }
            }
            // Present the image editor view as a sheet
            .sheet(isPresented: $isEditingImage) {
                ImageEditorView(uiImage: UIImage(data: imageData()!)!) { editedImage in
                    // Update the image after editing
                    if let index = arrImages.firstIndex(of: image) {
                        arrImages[index] = editedImage.pngData()?.base64EncodedString()
                    }
                }
            }
        }
        .frame(width: targetSize.width, height: targetSize.height)
    }
    
    // MARK: - Retrieve Data for Image Display
    private func imageData() -> Data? {
        if let index = arrImages.firstIndex(of: image), let dataString = arrImages[index], let data = Data(base64Encoded: dataString) {
            return data
        }
        return nil
    }
    
    // MARK: - Rearrange Images
    private func rearrangeImages(draggingImage: String) {
        if let sourceIndex = arrImages.firstIndex(of: draggingImage), let destinationIndex = arrImages.firstIndex(of: image) {
            withAnimation(.bouncy) {
                let sourceItem = arrImages.remove(at: sourceIndex)
                arrImages.insert(sourceItem, at: destinationIndex)
            }
        }
    }
}

// MARK: - Image Editor View for Zoom and Adjust
struct ImageEditorView: View {
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    let uiImage: UIImage
    var onSave: (UIImage) -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Main Photo")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 16)
            
            Spacer()
            
            GeometryReader { proxy in
                let cropSize = min(proxy.size.width, proxy.size.height)
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(scale)
                    .offset(offset)
                    .frame(width: cropSize, height: cropSize)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                scale = value.magnitude
                                
                            }
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation
                            }
                    )
            }
            .frame(height: 300) // Fixed height for editing
            
            Spacer()
            
            HStack(spacing: 20) {
                VStack {
                    Image(systemName: "hand.point.up.left.fill")
                    Text("Pinch to zoom")
                        .font(.caption)
                }
                
                VStack {
                    Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                    Text("Slide to adjust")
                        .font(.caption)
                }
            }
            .padding()
            
            Button(action: {
                let croppedImage = cropImage()
                onSave(croppedImage)
                dismiss()
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing, .bottom], 20)
        }
    }
    
    
    // MARK: - Crop and Center the Image
    private func cropImage() -> UIImage {
        let scaledWidth = uiImage.size.width * scale
        let scaledHeight = uiImage.size.height * scale
        
        // Calculate the cropping rectangle based on the offset and scale
        let cropRect = CGRect(
            x: -offset.width * scale + (scaledWidth - 300) / 2,
            y: -offset.height * scale + (scaledHeight - 300) / 2,
            width: 300,
            height: 300
        )
        
        // Ensure the cropRect is within the bounds of the image
        let imageWidth = uiImage.size.width
        let imageHeight = uiImage.size.height
        
        let correctedCropRect = cropRect.intersection(CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)) ?? CGRect.zero
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
        return renderer.image { _ in
            uiImage.draw(in: CGRect(x: -correctedCropRect.origin.x, y: -correctedCropRect.origin.y, width: scaledWidth, height: scaledHeight))
        }
    }
}
