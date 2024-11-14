//
//  SecondOnboard.swift
//  DTM
//
//  Created by Code Whiz on 11/14/24.
//

import SwiftUI

struct SecondBoard: View {
    @EnvironmentObject var secondBoardState: SecondBoardState
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack(alignment: .top){
            switch secondBoardState.state{
            case 1:
                Onboard4()
                    .transition(transition)
                    .padding(.top, 48) //music genre
            case 2:
                Onboard5()
                    .transition(transition)
                    .padding(.top, 48) // passion
            case 3:
                Onboard6()
                    .transition(transition)
                    .padding(.top, 48) // interess
            case 4:
                Onboard7_1()
                    .transition(transition)
                    .padding(.top, 48) //prompt1
            case 5:
                Onboard7_2()
                    .transition(transition)
                    .padding(.top, 48) //prompt2
            case 6:
                Onboard8()
                    .transition(transition)
                    .padding(.top, 48) //connect instagram
            case 7:
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
    SecondBoard()
        .environmentObject(SecondBoardState())
}
