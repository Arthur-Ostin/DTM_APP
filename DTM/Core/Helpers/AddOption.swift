//
//  AddOption.swift
//  DTM
//
//  Created by Code Whiz on 11/11/24.
//

import SwiftUI

struct AddOption: View {
    @Binding var specify: Bool
    @Binding var inputText: String
    @Binding var options: [String]
    
    
    var placeholder: String
    var maxOptions: Int = 3
        
    var body: some View {
        VStack(spacing: 0) {
            if specify {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            CustomTextField3(text: $inputText, placeholder: placeholder, onCommit: {
                                addOption()
                            })
                            .frame(height: 32, alignment: .trailing)
                            .padding(.bottom, 0)
                            
                            Button {
                                addOption()
                            } label: {
                                Text("add +")
                                    .font(
                                        Font.custom("ModernEra-Medium", size: 14)
                                            .weight(.medium)
                                    )
                                    .padding(.vertical, 6)
                                    .frame(width: 61, height: 23, alignment: .center)
                                    .foregroundColor(inputText.isEmpty || options.count >= maxOptions ? Color(red: 0.93, green: 0.93, blue: 0.93) : .black)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(inputText.isEmpty || options.count >= maxOptions ? Color(red: 0.93, green: 0.93, blue: 0.93) : Color(red: 0.89, green: 0.17, blue: 0.3), lineWidth: 1)
                                    )
                                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                            }
                            .padding(.trailing, 5)
                            .disabled(inputText.isEmpty || options.count >= maxOptions)
                        }
                        .frame(width: 255, alignment: .leading)
                        Spacer()
                    }
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .padding(.top, 0)
                            .background(.black)
                            .frame(width: 255, height: 1, alignment: .leading)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 43)
            } else {
                HStack(spacing: 10) {
                    Button {
                        specify = true
                    } label: {
                        Text("Other/specify")
                            .font(Font.custom("Modern Era", size: 14).weight(.medium))
                            .lineSpacing(21)
                            .foregroundColor(.black)
                    }
                    .padding(8)
                    .frame(width: 106, height: 30)
                    .background(Color(red: 0.90, green: 0.90, blue: 0.90))
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 43)
            }
        }
    }
    
    private func addOption() {
        guard !inputText.isEmpty, options.count < maxOptions else { return }
        options.append(inputText)
        inputText = ""
    }
}
