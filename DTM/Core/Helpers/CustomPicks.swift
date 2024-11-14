//
//  CustomPicks.swift
//  DTM
//
//  Created by Code Whiz on 11/10/24.
//

import SwiftUI

struct CustomPickerStyle: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Image(systemName: "chevron.right")
                .rotationEffect(.degrees(90))
        }
        .foregroundColor(.black) // テキストの色を黒に変更
    }
}

extension View {
    func customPickerStyle() -> some View {
        self.modifier(CustomPickerStyle())
    }
}


struct CustomPicker: View {
    @Binding var selectedValue: String
    let options: [String]
    @State private var showPicker = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text(selectedValue.isEmpty ? "Select your Answer" : selectedValue)
                    .foregroundColor(.black)
                    .opacity(selectedValue.isEmpty ? 0.2 : 1)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            .cornerRadius(8)
            .onTapGesture {
                showPicker.toggle()
            }
            
            Rectangle()
                .padding(.top, 0)
                .background(.black)
                .frame(height: 1)
        }
        
        if showPicker {
            List(options, id: \.self) { option in
                Button(action: {
                    selectedValue = option
                    showPicker = false
                }) {
                    Text(option)
                        .foregroundColor(.black)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .frame(maxHeight: 1000)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        }
        
    }
}
