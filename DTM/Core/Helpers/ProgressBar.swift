//
//  ProgressBar.swift
//  DTM
//
//  Created by Code Whiz on 11/10/24.
//

import SwiftUI



struct ProgressBar: View {
    @Binding var now: Int
    var progress: CGFloat {
        CGFloat(now) / 7
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 4)
                .foregroundColor(.clear) // No background color
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * progress, height: 4)
                .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.3))
                .cornerRadius(2)
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 5) // Shadow added here
        }
        .padding(.top, 20)
    }
}
