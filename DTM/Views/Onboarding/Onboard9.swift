//
//  Onboard9.swift
//  DTM
//
//  Created by Code Whiz on 11/12/24.
//

import SwiftUI
import PhotosUI

struct Onboard9: View {
    @State private var showImagePicker = false
    @State private var selectedImageIndex: Int? = nil
    @State private var showTooltip = false
    @State private var tooltipText = "You are far more likely to date if photos are clear and of you"
    @State private var selectedImages: [PhotosPickerItem] = []
    @State private var arrImages: [String?] = [nil, nil, nil, nil, nil, nil]  // Update to hold image data or placeholders
    @State private var draggingImage: String?
    @State private var uploadedImageCount = 0

    
    var body: some View {
        ScrollView {
            VStack {
                header
                progressBar
                addPhotosSection
                imageGridSection
                Spacer()
                createProfileButton
                    .padding(.top, 56)
                    .padding(.bottom, 30)
            }
        }
    }
    
    // MARK: - Header
    private var header: some View {
        VStack(alignment: .leading) {
            Button(action: {
                // Navigate to another view
            }) {
                Text("Complete later")
                    .font(Font.custom("ModernEra-Medium", size: 12).weight(.bold))
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 32)
                    .padding(.top, 16)
            }
        }
    }
    
    // MARK: - Progress Bar
    private var progressBar: some View {
        ProgressBar(now: $uploadedImageCount)
    }
    
    // MARK: - Add Photos Section
    private var addPhotosSection: some View {
        VStack(alignment: .leading) {
            Text("Add 6 photos")
                .font(Font.custom("New York", size: 28).weight(.bold))
                .lineSpacing(42)
                .foregroundColor(.black)
                .padding(.top, 60.23)
                .padding(.leading, 31)
            
            HStack(spacing: 5) {
                Text("It’s important you’re in them all!")
                    .font(Font.custom("Modern Era", size: 16).weight(.bold))
                    .foregroundColor(.black)
                
                Image(systemName: "info.circle")
                    .frame(width: 14, height: 14)
                    .onHover { isHovering in showTooltip = isHovering }
                    .overlay(tooltip)
            }
            .padding(.top, 61)
            .padding(.bottom, 50)
        }
    }
    
    // MARK: - Tooltip
    private var tooltip: some View {
        Text(tooltipText)
            .font(.caption)
            .padding(8)
            .background(Color.black.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(8)
            .opacity(showTooltip ? 1 : 0)
            .offset(y: -40)
    }
    
    
    
    private var imageGridSection: some View {
        VStack(alignment: .leading) {
            Text("Main")
                .font(Font.custom("Modern Era", size: 12).weight(.bold))
                .foregroundColor(.black)
                .padding(.leading, 31)
            
            imageGrid
            
            Text("Drag to reorder")
                .font(Font.custom("Modern Era", size: 12))
                .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                .padding(.top, 13)
        }
        .padding(.horizontal, 31)
    }
    
    
    // MARK: - Image Grid
    private var imageGrid: some View {
        let columns = Array(repeating: GridItem(spacing: 30), count: 3)
        
        return LazyVGrid(columns: columns, spacing: 24) {
            ForEach(0..<arrImages.count, id: \.self) { index in
                DraggableImageView(
                    image: arrImages[index] ?? "photoInput\(index + 1)",
                    arrImages: $arrImages,
                    draggingImage: $draggingImage,
                    uploadedImageCount: $uploadedImageCount
                )
                .frame(height: 100)
                .onTapGesture {
                    selectedImageIndex = index
                    showImagePicker.toggle()
                }
            }
        }
        .photosPicker(isPresented: $showImagePicker, selection: $selectedImages, maxSelectionCount: 6)
        .onChange(of: selectedImages) { _ in
            loadImages(startIndex: selectedImageIndex ?? 0)
        }
    }
    
    
    private func loadImages(startIndex: Int) {
        for (offset, imageItem) in selectedImages.enumerated() {
            let index = startIndex + offset
            guard index < arrImages.count else { break } // Prevent overflow
            
            imageItem.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        arrImages[index] = data.base64EncodedString()  // Store base64 encoded image data
                        uploadedImageCount += 1
                    }
                case .failure:
                    print("Failed to load image.")
                }
            }
        }
    }
    // MARK: - Create Profile Button
    private var createProfileButton: some View {
        Button(action: {
            // Create profile action
        }) {
            Text("Create Profile")
                .font(Font.custom("Modern Era", size: 18).weight(.bold))
                .foregroundColor(.white)
                .padding(10)
                .frame(width: 177, height: 48)
                .background(createProfileGradient)
                .cornerRadius(33)
        }
        .disabled(uploadedImageCount != 6)
    }
    
    // MARK: - Create Profile Button Gradient
    private var createProfileGradient: LinearGradient {
        uploadedImageCount == 6 ?
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.89, green: 0.17, blue: 0.30),
                Color(red: 0.91, green: 0.17, blue: 0.30),
                Color(red: 0.60, green: 0.09, blue: 0.25)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ) : LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.93, green: 0.93, blue: 0.93),
                Color(red: 0.93, green: 0.93, blue: 0.93),
                Color(red: 0.93, green: 0.93, blue: 0.93)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

#Preview{
    Onboard9()
}
