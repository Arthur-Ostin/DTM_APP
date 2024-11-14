//
//  Onboard8.swift
//  DTM
//
//  Created by Code Whiz on 11/12/24.
//

import SwiftUI
import SafariServices



//struct InstagramLoginView: UIViewControllerRepresentable {
//    let onComplete: (String?) -> Void
//    
//    func makeUIViewController(context: Context) -> SFSafariViewController {
//        let authURL = URL(string: "https://api.instagram.com/oauth/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&scope=user_profile&response_type=code")!
//        let safariVC = SFSafariViewController(url: authURL)
//        return safariVC
//    }
//    
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
//    
//    class Coordinator: NSObject, SFSafariViewControllerDelegate {
//        let parent: InstagramLoginView
//        init(parent: InstagramLoginView) { self.parent = parent }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//}

import SwiftUI
import FBSDKLoginKit

struct InstagramGraphLoginView: UIViewControllerRepresentable {
    let onComplete: (String?) -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        let loginManager = LoginManager()
        let viewController = UIViewController()
        
        // Trigger Facebook Login with Instagram-related permissions
        loginManager.logIn(permissions: ["public_profile", "email", "pages_show_list", "instagram_basic", "instagram_manage_insights"], from: viewController) { result, error in
            if let error = error {
                print("Facebook Login Error: \(error)")
                onComplete(nil)
            } else if let result = result, !result.isCancelled, let token = AccessToken.current?.tokenString {
                onComplete(token) // Return access token
            } else {
                onComplete(nil)
            }
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

import SwiftUI

//struct Onboard8: View {
//    @State private var showInstagramLogin = false
//    @State private var instagramUserName: String = ""
//    @State private var mutualFollowerCount: Int? = nil
//    @State private var isInstagramConnected = false
//    @EnvironmentObject var onboardingState: OnboardState
//    
//    var body: some View {
//        VStack {
//            Button(action: {
//                showInstagramLogin = true
//            }) {
//                Text(isInstagramConnected ? "Instagram Connected" : "Connect Instagram")
//                    .font(.headline)
//            }
//            
//            if let count = mutualFollowerCount {
//                Text("Mutual Followers: \(count)")
//                    .font(.title)
//            } else {
//                Text("No mutual followers found")
//                    .foregroundColor(.gray)
//            }
//        }
//        .sheet(isPresented: $showInstagramLogin) {
//            InstagramGraphLoginView(onComplete: handleInstagramLogin)
//        }
//    }
//    
//    private func handleInstagramLogin(accessToken: String?) {
//        guard let token = accessToken else { return }
//        isInstagramConnected = true
//        fetchInstagramFollowers(accessToken: token)
//    }
//}
//
//import Foundation
//
//extension Onboard8 {
//    private func fetchInstagramFollowers(accessToken: String) {
//        // Replace `YOUR_USER_ID` with the Instagram Business Account ID you want to fetch data for
//        let url = URL(string: "https://graph.instagram.com/me?fields=username,followers_count&access_token=\(accessToken)")!
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error fetching Instagram data: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    DispatchQueue.main.async {
//                        if let followersCount = json["followers_count"] as? Int {
//                            self.mutualFollowerCount = followersCount
//                        }
//                    }
//                }
//            } catch {
//                print("Error parsing JSON: \(error)")
//            }
//        }.resume()
//    }
//}


struct Onboard8: View {
    @State private var showInstagramLogin = false
    @State private var instagramUserName: String = ""
    @State private var mutualFollowerCount: Int? = nil
    @State private var isInstagramConnected = false
    @State private var now = 5
    @EnvironmentObject var secondBoardState: SecondBoardState

    var body: some View {
        VStack {
            Button {
                // Navigate to another view
            } label: {
                Text("Complete later")
                    .font(Font.custom("ModernEra-Medium", size: 12).weight(.bold))
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 32)
                    .padding(.top, 16)
            }
            
            ProgressBar(now: $now)
            
            
            Text("Connect Instagram")
                .font(Font.custom("New York", size: 28).weight(.bold))
                .lineSpacing(42)
                .foregroundColor(.black)
            
            
            Text("Profiles only display no. mutual followers")
                .font(Font.custom("Modern Era", size: 16).weight(.bold))
                .lineSpacing(24)
                .foregroundColor(Color(red: 0.16, green: 0.65, blue: 0.27))
            Spacer()
            
            if let count = mutualFollowerCount {
                VStack {
                    Image(systemName: "person.2.fill") // Placeholder for mutuals preview image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("\(count) mutuals")
                        .font(.headline)
                        .padding(.top, 10)
                }
                .padding(.bottom, 50)
            } else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 181.31, height: 250)
                    .background(
                        Image("instascreen")
                    )
                    .cornerRadius(20)
                    .padding(.bottom, 96)
            }
            
            Button(action: {
//                connectToInstagram()
                withAnimation(.spring()){
                    secondBoardState.state += 1
                }
            }) {
                HStack(spacing: 20) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 25, height: 25)
                        .background(
                            Image("instagram")
                        )
                    Text(isInstagramConnected ? "Instagram Connected" : "Connect Instagram ")
                        .font(Font.custom("Proxima Nova", size: 18).weight(.bold))
                        .foregroundColor(.black)
                }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 16, trailing: 34))
                .frame(width: 260, height: 56)
                .cornerRadius(35)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .inset(by: 0.50)
                        .stroke(Color(red: 1, green: 0.11, blue: 0.56), lineWidth: 0.50)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .inset(by: 0.50)
                        .stroke(Color(red: 1, green: 0.84, blue: 0), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 8, y: 4
                )
            }
            .padding(.bottom, 30)
            
            Spacer()
        }
        .sheet(isPresented: $showInstagramLogin) {
//            InstagramLoginView(onComplete: handleInstagramLogin)
        }
    }

    // Function to initiate Instagram login
    private func connectToInstagram() {
        showInstagramLogin = true
    }

    // Handle Instagram login and get data
    private func handleInstagramLogin(accessToken: String?) {
        guard let token = accessToken else { return }
        isInstagramConnected = true
        fetchMutualFollowers(accessToken: token)
    }

    // Fetch mutual followers (placeholder)
    private func fetchMutualFollowers(accessToken: String) {
        // Instagram API call to get mutual followers
        // Simulate response for demo
        mutualFollowerCount = 13 // Set a sample mutual follower count
    }
}
#Preview {
    Onboard8()
}
