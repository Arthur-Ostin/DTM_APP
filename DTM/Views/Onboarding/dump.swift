//
//  dump.swift
//  DTM
//
//  Created by Code Whiz on 11/12/24.
//


//    @State private var showImagePicker = false
//    @State private var selectedImageIndex: Int? = nil
//    @State private var showTooltip = false
//    @State private var tooltipText = "You are far more likely to date if photos are clear and of you"
//    @State private var selectedImages: [PhotosPickerItem] = []
//    @State private var data: Data?
//    @State private var arrImages: [String] = ["photoInput1", "photoInput2", "photoInput3", "photoInput4", "photoInput5", "photoInput6"]
//    @State private var draggingImage: String?
//    @State private var uploadedImageCount = 0

// MARK: - Image Grid Section
//    private var imageGridSection: some View {
//        VStack(alignment: .leading) {
//            Text("Main")
//                .font(Font.custom("Modern Era", size: 12).weight(.bold))
//                .foregroundColor(.black)
//                .padding(.leading, 31)
//
//            imageGrid
//
//            Text("Drag to reorder")
//                .font(Font.custom("Modern Era", size: 12))
//                .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
//                .padding(.top, 13)
//        }
//        .padding(.horizontal, 31)
//    }
//
//    // MARK: - Image Grid
//    private var imageGrid: some View {
//        let columns = Array(repeating: GridItem(spacing: 30), count: 3)
//
//        return LazyVGrid(columns: columns, spacing: 24) {
//            ForEach(arrImages, id: \.self) { image in
//                DraggableImageView(image: image, arrImages: $arrImages, draggingImage: $draggingImage, uploadedImageCount: $uploadedImageCount)
//                    .frame(height: 100)
//            }
//        }
//    }





//struct DraggableImageView: View {
//    let image: String
//    @Binding var arrImages: [String]
//    @Binding var draggingImage: String?
//    @Binding var uploadedImageCount: Int
//
//    @State private var selectedImages: [PhotosPickerItem] = []
//    @State private var data: Data?
//    private let targetSize = CGSize(width: 90, height: 90)
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                if let data = data, let uiImage = UIImage(data: data) {
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .frame(width: targetSize.width, height: targetSize.height)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                } else {
//                    Image("photoInput")
//                        .resizable()
//                        .frame(width: targetSize.width, height: targetSize.height)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                }
//
//                PhotosPicker(selection: $selectedImages, maxSelectionCount: 6, matching: .images) {
//                    Color.clear
//                }
//                .frame(width: targetSize.width, height: targetSize.height)
//                .onChange(of: selectedImages) { _ in
//                    loadImage()
//                }
//            }
//            .draggable(image) {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.clear)
//                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .onAppear { draggingImage = image }
//            }
//            .dropDestination(for: String.self) { item, location in false }
//            isTargeted: { status in
//                if let draggingImage = draggingImage, status, draggingImage != image {
//                    rearrangeImages(draggingImage: draggingImage)
//                }
//            }
//        }
//    }
//
//    // MARK: - Load Image
//    private func loadImage() {
//        guard let image = selectedImages.first else { return }
//        image.loadTransferable(type: Data.self) { result in
//            switch result {
//            case .success(let data):
//                if let data = data, let uiImage = UIImage(data: data) {
//                    self.data = cropAndResizeImage(uiImage: uiImage)
//                    uploadedImageCount += 1
//                }
//
//            case .failure:
//                print("Failed to load image.")
//            }
//        }
//    }
//
//    // MARK: - Crop and Resize Image
//    private func cropAndResizeImage(uiImage: UIImage) -> Data? {
//        let scaleFactor = max(targetSize.width / uiImage.size.width, targetSize.height / uiImage.size.height)
//        let width = uiImage.size.width * scaleFactor
//        let height = uiImage.size.height * scaleFactor
//        let cropRect = CGRect(x: (width - targetSize.width) / 2, y: (height - targetSize.height) / 2, width: targetSize.width, height: targetSize.height)
//
//        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
//        uiImage.draw(in: CGRect(origin: CGPoint(x: -cropRect.origin.x, y: -cropRect.origin.y), size: CGSize(width: width, height: height)))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return newImage?.jpegData(compressionQuality: 1.0)
//    }
//
//    // MARK: - Rearrange Images
//    private func rearrangeImages(draggingImage: String) {
//        if let sourceIndex = arrImages.firstIndex(of: draggingImage), let destinationIndex = arrImages.firstIndex(of: image) {
//            withAnimation(.bouncy) {
//                let sourceItem = arrImages.remove(at: sourceIndex)
//                arrImages.insert(sourceItem, at: destinationIndex)
//            }
//        }
//    }
//}






//struct DraggableImageView: View {
//    let image: String
//    @Binding var arrImages: [String?]
//    @Binding var draggingImage: String?
//    @Binding var uploadedImageCount: Int
//    private let targetSize = CGSize(width: 90, height: 90)
//
////    MARK: -
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack (alignment: .topLeading){
//                if let imageData = imageData(), let uiImage = UIImage(data: imageData) {
//                    // Display the selected image
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: targetSize.width, height: targetSize.height)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//
//                    // Display a repick icon at the top right corner
//                    VStack {
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                // Edit the image
//
//                            }) {
//                                Image("repick")
//                                    .foregroundColor(.white)
//                                    .padding(4)
//                                    .background(Color.white)
//                                    .clipShape(Circle())
//                            }
//                            .padding([.top, .trailing], 4)
//                        }
//                        Spacer()
//                    }
//                } else {
//                    // Default placeholder image
//                    Image("photoInput")
//                        .resizable()
//                        .frame(width: targetSize.width, height: targetSize.height)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                }
//            }
//            .draggable(image) {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.clear)
//                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .onAppear {
//                        draggingImage = image
//                    }
//            }
//            .dropDestination(for: String.self) { item, location in false }
//            isTargeted: { status in
//                if let draggingImage = draggingImage, status, draggingImage != image {
//                    rearrangeImages(draggingImage: draggingImage)
//                }
//            }
//        }
//        .frame(width: targetSize.width, height: targetSize.height)
//    }
//
//    // MARK: - Retrieve Data for Image Display
//    private func imageData() -> Data? {
//        if let index = arrImages.firstIndex(of: image), let dataString = arrImages[index], let data = Data(base64Encoded: dataString) {
//            return data
//        }
//        return nil
//    }
//
//    // MARK: - Rearrange Images
//
//
//    private func rearrangeImages(draggingImage: String) {
//        if let sourceIndex = arrImages.firstIndex(of: draggingImage), let destinationIndex = arrImages.firstIndex(of: image) {
//            withAnimation(.bouncy) {
//                let sourceItem = arrImages.remove(at: sourceIndex)
//                arrImages.insert(sourceItem, at: destinationIndex)
//            }
//        }
//    }
//}
