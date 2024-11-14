
//  TonightView.swift
//  DTM
//
//  Created by Code Whiz on 11/14/24.
//

import SwiftUI

struct TonightView: View {
    // Tracks the selected tab
    @State private var selectedTab = "Tonight"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tonight View
            TonightContentView()
                .tabItem {
                    Image("moon")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == "Tonight" ? .red : .gray)
                    
                }
            
            // Down to Meet View
            DtmView()
                .tabItem {
                    Image("Loveheart")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == "Meet" ? .red : .gray)
                    
                }
            // Saved Meet-ups View
            MeetUpsView()
                .tabItem {
                    Image("saved")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == "Saved" ? .red : .gray)
                    
                }
            
            // Matches View
            MatchesView()
                .tabItem {
                    Image("chat")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == "Matches" ? .red : .gray)
                    
                }
            
        }
        .accentColor(.red) // Sets the accent color for text on the selected tab
        .navigationBarBackButtonHidden(true)
    }
}

// Main content for Tonight tab
struct TonightContentView: View {
    var body: some View {
        VStack (spacing: 0) {
            // Title text aligned to the left
            VStack(alignment: .leading) {
                Text("Tonight")
                    .font(Font.custom("Modern Era", size: 24).weight(.bold))
                    .tracking(0.48)
                    .lineSpacing(36)
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.top, 64)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 20)
            
            // Subtitle text centered
            VStack(alignment: .center) {
                Text("Available once a week")
                    .font(Font.custom("New York", size: 18))
                    .lineSpacing(27)
                    .foregroundColor(.black)
                
                Text("Send & receive invites for meet ups today")
                    .font(Font.custom("New York", size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 327, height: 50)
                    .padding(.top, 48)
                    .padding(.bottom, 89)
                
                // Create Profile Button
                Button(action: {
                    // Action for creating profile
                }) {
                    HStack(spacing: 10) {
                        Text("Create Profile")
                            .font(Font.custom("Modern Era", size: 18).weight(.bold))
                            .lineSpacing(27)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 18, leading: 40, bottom: 18, trailing: 40))
                    .frame(width: 195, height: 49)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.89, green: 0.17, blue: 0.30), Color(red: 0.91, green: 0.17, blue: 0.30), Color(red: 0.60, green: 0.09, blue: 0.25)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(33)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 6, y: 4)
                }
            }
            .padding(.top, 108)
            
            Spacer()
        }
        .padding(.bottom) // Bottom padding to avoid overlap with the Tab Bar
    }
}



#Preview {
    TonightView()
}
