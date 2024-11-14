//
//  NextMe.swift
//  DTM
//
//  Created by Code Whiz on 11/11/24.
//

import SwiftUI

//struct NextButton: View {
//    var state: Int
//    var isNextEnabled: Bool
//    @Binding var now: Int
//    
//    @EnvironmentObject var onboardingState: OnboardState
//    var body: some View {
//        Button {
//            withAnimation(.spring()){
//                onboardingState.state = state
//            }
//        } label: {
//            Text("Next")
//                .font(
//                    Font.custom("ModernEra-Medium", size: 16)
//                )
//                .bold()
//                .frame(width: 85, height: 52)
//                .foregroundColor(Color.white)
//                .background(
//                    LinearGradient(
//                        gradient: Gradient(colors: isNextEnabled
//                                           ? [Color(red: 0.89, green: 0.17, blue: 0.30), Color(red: 0.91, green: 0.17, blue: 0.30), Color(red: 0.60, green: 0.09, blue: 0.25)]
//                                           : [Color(red: 0.93, green: 0.93, blue: 0.93)]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                    
//                )
//                .cornerRadius(33)
//                .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 2)
//        }
//        .frame(maxWidth: .infinity, alignment: .trailing)
//        .disabled(!isNextEnabled)
////        .onChange(of: isNextEnabled) { enabled in
////            if enabled {
////                now = now + 1
////            }
////            else {
////                now = 1
////            }
////        }
//        .simultaneousGesture(TapGesture().onEnded {
//            //   updateProfile(segment: "music1", value: genre1)
//            //   updateProfile(segment: "music2", value: genre2)
//        })
//    }
//}

struct NextButton: View {
    var state: Int
    var isNextEnabled: Bool
    @Binding var now: Int
    var customAction: (() -> Void)? = nil  // Optional custom action
    
    @EnvironmentObject var secondBoardState: SecondBoardState
    
    var body: some View {
        Button {
            if let action = customAction {
                action()  // Use custom action if provided
            } else {
                // Default action
                withAnimation(.spring()) {
                    secondBoardState.state += 1
                }
            }
        } label: {
            Text("Next")
                .font(
                    Font.custom("ModernEra-Medium", size: 16)
                )
                .bold()
                .frame(width: 85, height: 52)
                .foregroundColor(Color.white)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: isNextEnabled
                                           ? [Color(red: 0.89, green: 0.17, blue: 0.30), Color(red: 0.91, green: 0.17, blue: 0.30), Color(red: 0.60, green: 0.09, blue: 0.25)]
                                           : [Color(red: 0.93, green: 0.93, blue: 0.93)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(33)
                .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .disabled(!isNextEnabled)
        .simultaneousGesture(TapGesture().onEnded {
            // Additional gesture action can go here
        })
    }
}



