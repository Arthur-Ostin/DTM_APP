//
//  MatchesView.swift
//  DTM
//
//  Created by Code Whiz on 11/14/24.
//


import SwiftUI




struct MatchesView: View {
    @State private var isShowingNoProfile = false  // State to control fullScreenCover
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Profile navigation button
                VStack {
                    HStack(alignment: .center, spacing: 6) {
                        Button(action: {
                            isShowingNoProfile = true  // Show the full screen cover
                        }) {
                            HStack(spacing: 6) {
                                Text("Your Profile")
                                    .font(Font.custom("Modern Era", size: 14))
                                    .lineSpacing(21)
                                    .foregroundColor(.black)
                                Image("dtm2")
                            }
                            .padding(EdgeInsets(top: 11, leading: 0, bottom: 6, trailing: 14))
                            .frame(width: 126, height: 40)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(
                                color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4, y: 1
                            )
                        }
                    }
                    .padding(.trailing, 21)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack(alignment: .leading) {
                    Text("Matches")
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
                    Text("Text any past meet-ups here")
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
            .fullScreenCover(isPresented: $isShowingNoProfile) {
                
                    NoProfileView()
                        
                
//                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}




// Preview provider
#Preview {
    MatchesView()
}
