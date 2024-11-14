//
//  OnboardingView.swift
//  DTM
//
//  Created by Code Whiz on 11/8/24.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var onboardingState: OnboardState
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack(alignment: .top){
            switch onboardingState.state{
            case 1:
                Onboard1()
                    .transition(transition)
                    .padding(.top, 48) //gender
            case 2:
                Onboard2()
                    .transition(transition)
                    .padding(.top, 48) //nationality
            case 3:
                Onboard3()
                    .transition(transition)
                    .padding(.top, 48) //height
//            case 4:
//                Onboard4()
//                    .transition(transition)
//                    .padding(.top, 48) //hometown
            case 4:
                Onboard5()
                    .transition(transition)
                    .padding(.top, 48) //music genre
            case 5:
                Onboard6()
                    .transition(transition)
                    .padding(.top, 48) // passion
            case 6:
                Onboard7_1()
                    .transition(transition)
                    .padding(.top, 48) //prompt1
            case 7:
                Onboard7_2()
                    .transition(transition)
                    .padding(.top, 48) //prompt2
            case 8:
                Onboard8()
                    .transition(transition)
                    .padding(.top, 48) //connect instagram
            case 9:
                Onboard9()
                    .transition(transition)
                    .padding(.top, 48) //pick pictures
            default:
                RoundedRectangle(cornerRadius: 20.0)
                    .background(.white)
                    .ignoresSafeArea(.all)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardState())
}
