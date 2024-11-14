//
//  NoProfile.swift
//  DTM
//
//  Created by Code Whiz on 11/14/24.

import SwiftUI

struct NoProfileView: View {
    // Tracks the selected tab
    @State private var selectedTab = "Tonight"

    var body: some View {
        TabView(selection: $selectedTab) {
            // Tonight View
            NoProfileContentView()
                .tabItem {
                    Image("Two_Heads")
                }
                .tag("Tonight")

            // Down to Meet View
            DtmView()
                .tabItem {
                    Image("Cocktail")
                }
                .tag("Meet")

            // Saved Meet-ups View
            MeetUpsView()
                .tabItem {
                    Image("Loveheart")
                }
                .tag("Saved")

            // Matches View
            MatchesView()
                .tabItem {
                    Image("saved")
                }
                .tag("Matches")
        }
        .accentColor(.red)
        .navigationBarBackButtonHidden(true)
    }
}


struct NoProfileContentView: View {
    @Environment(\.presentationMode) var presentationMode // Environment variable to control view dismissal
    @StateObject private var secondBoardState = SecondBoardState()
    @State private var showOnboard4 = false // State to control full-screen presentation
    
    var body: some View {
        VStack(spacing: 0) {
            // Title text aligned to the left
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Dismiss view on chevron tap
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black) // Set chevron color if needed
                    }
                }
                .padding(.leading, 23)
                .frame(width: 13.21, height: 7)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
//            Spacer().frame(height: 20)
            
            // Subtitle text centered
            VStack(alignment: .center) {
                Text("Arthur")
                    .font(Font.custom("Modern Era", size: 24).weight(.bold))
                    .tracking(0.48)
                    .lineSpacing(36)
                    .foregroundColor(.black)
                    .padding(.bottom, 26)
                    .padding(.top, 38.79)

                Text("arthur.ostin@mail. mcgill.ca")
                    .font(Font.custom("Modern Era", size: 14))
                    .lineSpacing(21)
                    .foregroundColor(.gray)
                
                // Create Profile Button
                Button(action: {
                    showOnboard4 = true // Trigger full-screen presentation
                }) {
                    Text("Create Profile")
                        .font(Font.custom("Modern Era", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 195, height: 49)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.89, green: 0.17, blue: 0.30),
                                    Color(red: 0.91, green: 0.17, blue: 0.30),
                                    Color(red: 0.60, green: 0.09, blue: 0.25)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(33)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, y: 4)
                }
                .padding(.top, 274)
                .fullScreenCover(isPresented: $showOnboard4) {
                    SecondBoard().environmentObject(secondBoardState)
                }
            }
//            .padding(.top, 108)
            
            Spacer()
            
            Rectangle()
                .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.70))
                .padding(.horizontal, 16)
                .frame(height: 1) // Set frame height for the line
        }
    }
}


#Preview {
    NoProfileView()
}
