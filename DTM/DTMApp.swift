//
//  DTMApp.swift
//  DTM
//
//  Created by 水野裕介 on 2024/06/18.
//

import SwiftUI
import Firebase
import FirebaseStorage
import UIKit
import PhotosUI
import UserNotifications

// settings for using firebase
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        
//        return true
//    }
//}



class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
        
        // 通知の許可をリクエスト
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification authorization request failed: \(error)")
            } else {
                print("Notification authorization granted: \(granted)")
            }
        }
        
        return true
    }
    
    // This method will be called when the app receives a remote notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler(.noData)
            return
        }
        
        // Handle your other notifications here
        completionHandler(.newData)
    }
    
    // This method will be called when APNs has assigned the device a unique token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Auth.auth().setAPNSToken(deviceToken, type: .prod)
    }
    
    // This method will be called if APNs cannot successfully complete the registration process
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error)")
    }
    
    // Handle notification while app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler([])
            return
        }
        
        // Show notification even if app is in foreground
        completionHandler([.alert, .badge, .sound])
    }
    
    // Handle notification when user interacts with it (background, closed, etc.)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler()
            return
        }
        
        // Handle your other notifications here
        completionHandler()
    }
}

// main struct
//@main
//struct DTMApp: App {
//    // register app delegate for Firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                // AuthenticationView()
//                FirstPageView()
//                    .preferredColorScheme(.light)
//            }
//        }
//    }
//}

@main
struct DTMApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var onboardingState = OnboardState()
    
    // @State var selection = 3
    
    var body: some Scene {
        WindowGroup {
            // serarchProfileView()
            // SwiftUIView()
            // TopMainTab(selection: $selection)
            FirstPageView()
//            RegisterC1()
//            OnboardingView()
//                .environmentObject(onboardingState)
            // RegisterPhoto()
            // TopTonightview()
            // PickFromMap_ViewAdaptor(userLocationCoordinate: CLLocationCoordinate2DMake(34.704172, 135.496324))
            // DoubleDatesMatch()
        }
    }
}


// upload Image function
func uploadProfileImage(image: UIImage, completion: @escaping (String?) -> Void) {
    let storageRef = Storage.storage().reference().child("profile_images/\(UUID().uuidString).jpg")
    if let imageData = image.jpegData(compressionQuality: 0.8) {
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if error != nil {
                print("Failed to upload image: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            storageRef.downloadURL { url, error in
                if let downloadURL = url {
                    completion(downloadURL.absoluteString)
                } else {
                    print("Failed to get download URL: \(error!.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
}
 

// for a lot inputForm with DONE bottun
struct CustomTextView: UIViewRepresentable {
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextView
        
        init(parent: CustomTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == self.parent.placeholder {
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = self.parent.placeholder
                textView.textColor = .gray
            }
        }
    }
    
    @Binding var text: String
    var placeholder: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = placeholder
        textView.textColor = .gray
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = true
        textView.backgroundColor = .white
        
        // キーボードアクセサリービューを作成
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: textView, action: #selector(textView.resignFirstResponder))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        textView.inputAccessoryView = toolbar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text.isEmpty {
//            uiView.text = placeholder
//            uiView.textColor = .gray
        } else if uiView.text != text && uiView.text != placeholder {
            uiView.text = text
            uiView.textColor = .black
        }
    }
}



struct CustomTextField3: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var onCommit: () -> Void
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var onCommit: () -> Void
        
        init(text: Binding<String>, onCommit: @escaping () -> Void) {
            _text = text
            self.onCommit = onCommit
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            onCommit()
            return true
        }
        
        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            onCommit()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, onCommit: onCommit)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        
        // Set custom font for placeholder
        let font = UIFont(name: "Modern Era", size: 20) ?? UIFont.systemFont(ofSize: 20)
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .font: font,
                .foregroundColor: UIColor(white: 0.86, alpha: 1.0)
            ]
        )
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))
        toolbar.setItems([flexSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// UIImagePickerControllerを使うためのUIViewControllerRepresentable
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

// PHPickerViewControllerを使うためのUIViewControllerRepresentable
struct PhotoLibraryPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoLibraryPicker
        
        init(parent: PhotoLibraryPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            guard let provider = results.first?.itemProvider else {
                parent.presentationMode.wrappedValue.dismiss()
                return
            }
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        self.parent.image = image as? UIImage
                        self.parent.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

// for selecting photos
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        self.parent.image = image as? UIImage
                    }
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

class CustomTextField4: UITextField {
    var onDeleteBackward: (() -> Void)?
    
    override func deleteBackward() {
        super.deleteBackward()
        onDeleteBackward?()
    }
}

struct CustomTextFieldRepresentable: UIViewRepresentable {
    @Binding var text: String
    var tag: Int
    var onDeleteBackward: (() -> Void)?
    var onCommit: (() -> Void)?
    
    func makeUIView(context: Context) -> CustomTextField4 {
        let textField = CustomTextField4()
        textField.delegate = context.coordinator
        textField.tag = tag
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.onDeleteBackward = {
            onDeleteBackward?()
        }
        return textField
    }
    
    func updateUIView(_ uiView: CustomTextField4, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextFieldRepresentable
        
        init(_ parent: CustomTextFieldRepresentable) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text, text.count >= 1 && !string.isEmpty {
                return false
            }
            return true
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text {
                DispatchQueue.main.async {
                    self.parent.text = text
                }
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit?()
            return true
        }
    }
}

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left") // ここでアイコンをカスタマイズ
                    .font(
                        Font.custom("Modern Era", size: 14)
                    ) // アイコンのサイズをカスタマイズ
                Text("Back")
                    .font(
                        Font.custom("Modern Era", size: 14)
                    ) // テキストのサイズをカスタマイズ
            }
            .foregroundColor(Color(red: 0.66, green: 0.66, blue: 0.66)) // テキストとアイコンの色をカスタマイズ
        }
    }
}

struct CustomBackButton2: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left") // ここでアイコンをカスタマイズ
                    .font(
                        Font.custom("Modern Era", size: 17)
                            .weight(.bold)
                    ) // アイコンのサイズをカスタマイズ
                Text("Back")
                    .font(
                        Font.custom("Modern Era", size: 17)
                    ) // テキストのサイズをカスタマイズ
            }
            .foregroundColor(Color(red: 0.66, green: 0.66, blue: 0.66)) // テキストとアイコンの色をカスタマイズ
        }
    }
}





