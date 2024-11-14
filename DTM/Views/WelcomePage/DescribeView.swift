//
//  DescribeView.swift
//  DTM
//
//  Created by 水野裕介 on 2024/06/22.
//

import SwiftUI

struct DescribeView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            // Title
            HStack (alignment: .center){
                Spacer()
                Button() {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(20)
                .padding(.top, 50)
            }
            
            Divider()
            
            // Meet coolguys Image
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 180, height: 180)
                .background(
                    Image("coolguys")
                        .resizable()
                )
                .padding(.top, 0)
            
            Text("1-2-1 Meet")
                .font(Font.custom("ModernEra-Bold", size: 24).weight(.bold))
                .lineSpacing(33.60)
                .foregroundColor(Color(red: 0.03, green: 0.03, blue: 0.03))
            Text("Meet a McGill student by sending them a time & place (No texting)")
                .font(Font.custom("Modern Era", size: 18).weight(.medium))
                .lineSpacing(5)
                .lineLimit(2)   // Limit text to two lines
                .multilineTextAlignment(.center)
                .frame(width: 357, height: 60, alignment: .center)
                .foregroundColor(.black)
            
            HStack {
                Divider()
                    .frame(width: 130, height: 0.5)
                    .background(Color("greyColor"))

                Text("OR")
                    .font(Font.custom("ModernEra-Bold", size: 18))
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)

                Divider()
                    .frame(width: 130, height: 0.5)
                    .background(Color("greyColor"))
            }
            .frame(maxWidth: .infinity)
            // Allows dividers to take available width
            .padding(.top, 48)

        
            
            // Social Image
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 231.09677, height: 144)
                .background(
                    Image("howsPage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 231.09677124023438, height: 144)
                        .clipped()
                )
                .padding(.top, 48)
            Text("Social Invite ")
                .font(Font.custom("ModernEra-Bold", size: 24))
                .fontWeight(.bold)
                .lineSpacing(33.60)
                .foregroundColor(Color("headingColor"))
            
            // Main2
            Text("Invite them to a house party, club or bar & both go with your friends")
                .font(Font.custom("Modern Era", size: 18).weight(.medium))
                .lineSpacing(5)
                .lineLimit(2)   // Limit text to two lines
                .multilineTextAlignment(.center)
                .frame(width: 357, height: 60, alignment: .center)
                .foregroundColor(.black)
                .padding(.bottom, 38)
            
            // Button
            VStack{
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 0) {
                        Text("Got it")
                            .font(Font.custom("Modern Era", size: 16).weight(.bold))
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 15, leading: 36, bottom: 15, trailing: 36))
                    .frame(width: 115, height: 41)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.89, green: 0.17, blue: 0.30), Color(red: 0.91, green: 0.17, blue: 0.30), Color(red: 0.60, green: 0.09, blue: 0.25)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(23.31)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 8, y: 4
                    )
            }
            }.padding(.bottom, 61.5)
            
//            Spacer()
//            Spacer()
        }
    }
}

#Preview {
    DescribeView()
}
