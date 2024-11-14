//
//  RegisterC3.swift
//  DTM
//
//  Created by 水野裕介 on 2024/06/22.
//  Modified by Code Whiz
//

import SwiftUI

struct Onboard4: View {
    @State var inputHometown = ""
    @State private var savedHometown = ""
    @State private var fieldVisibility = true
    @State var faculty = ""
    @State var often = ""
    @State private var navigate = false

    
    @FocusState private var isFocused: Bool
    @State var showPicker1 = false
    @State var showPicker2 = false
    
    @EnvironmentObject var secondBoardState: SecondBoardState
    public var body: some View {
            VStack {
                Button {
                    withAnimation(.spring()){
                        secondBoardState.state += 1
                    }
                    
                } label: {
                    Text("Complete later")
                        .font(
                            Font.custom("ModernEra-Medium", size: 12)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 32)
                        .padding(.top, 16)
                }
                //            MARK: HOMETOWN
                VStack(alignment: .leading) {
                    HStack {
                        Text("My Hometown")
                            .font(
                                Font.custom("New York", size: 28)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(height: 20, alignment: .leading)
                        Spacer()
                        if (!fieldVisibility) {
                            Button{
                                fieldVisibility = true
                            } label: {
                                Text("Edit")
                                    .font(Font.custom("Modern Era", size: 14).weight(.medium))
                                    .lineSpacing(21)
                                    .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.30))
                            }
                            
                        }
                    }
                    if fieldVisibility
                    {
                        VStack(spacing: 0) {
                            
                            CustomTextField3(text: $inputHometown, placeholder: "Type hometown", onCommit: {
                                if !inputHometown.isEmpty {
                                    savedHometown = inputHometown
                                    fieldVisibility = false
                                    checkAndNavigate()
                                }
                            })
                            .onAppear{
                                isFocused = true
                            }
                            .focused($isFocused)
                            .frame(height: 32, alignment: .trailing)
                            .padding(.bottom, 5)
                            
                            Rectangle()
                                .padding(.top, 0)
                                .background(.black)
                                .frame(height: 1)
                        }
                        .padding(.top, 28)
                    } else{
                        Text("🏡 \(savedHometown)")
                            .font(Font.custom("Modern Era", size: 20).weight(.medium))
                            .lineSpacing(30)
                            .padding(10)
                            .padding(.top, 48)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    // MARK: FACULTY
                    HStack {
                        Text("Faculty")
                            .font(Font.custom("New York", size: 28).weight(.bold))
                            .lineSpacing(42)
                            .padding(.top, 40)
                            .foregroundColor(.black)
                        Spacer()
                        if (!faculty.isEmpty) {
                            Button{
                                faculty = ""
                            } label: {
                                Text("Edit")
                                    .font(Font.custom("Modern Era", size: 14).weight(.medium))
                                    .lineSpacing(21)
                                    .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.30))
                            }
                        }
                    }
                    // FACULTY PICKER
                    if faculty.isEmpty  { VStack {
                        HStack {
                            Text("Select your Answer")
                                .font(Font.custom("Modern Era", size: 20).weight(.medium))
                                .lineSpacing(30)
                                .foregroundColor(.black)
                                .opacity(faculty.isEmpty ? 0.2 : 1)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
//                        .padding(.top, 10)
                        
                        .padding(.bottom, 10)
                        .background(Color.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            showPicker1.toggle()
                            
                        }
                        Rectangle()
                            .padding(.top, 0)
                            .background(.black)
                            .frame(height: 1)
                    }
                        .padding(.top, 23)}
                    
                    else {Text("\(faculty)")
                            .font(Font.custom("Modern Era", size: 20).weight(.medium))
                            .lineSpacing(30)
                            .padding(20)
                        .frame(maxWidth: .infinity, alignment: .center)}
                    
                    ZStack {
                        if showPicker1 {
                            List(faculties, id: \.self) { option in
                                Button(action: {
                                    faculty = option
                                    showPicker1 = false
                                    checkAndNavigate()
                                }) {
                                    Text(option)
                                        .foregroundColor(.black)
                                }
                            }
                            .scrollContentBackground(.hidden)
                            .listStyle(.plain)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                        
                        if showPicker2 {
                            List(goOutOften, id: \.self) { option in
                                Button(action: {
                                    often = option
                                    showPicker2 = false
                                    checkAndNavigate()
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
                        // MARK: OFTEN/EVENING PICKER
                        if (showPicker1 == false) && (showPicker2 == false) {
                            VStack(spacing: 0) {
                                // How often do you go out/not work in the evenings?
                                HStack(spacing: 0) {
                                    Text("I go out/take the evenings off")
                                        .font(
                                            Font.custom("New York", size: 28)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(.black)
                                        .frame(width: 246, height: 72, alignment: .topLeading)
                                        .padding(.top, 40)
                                    
                                    Spacer()
                                    
                                    if (!often.isEmpty) {
                                        Button{
                                            often = ""
                                        } label: {
                                            Text("Edit")
                                                .font(Font.custom("Modern Era", size: 14).weight(.medium))
                                                .lineSpacing(21)
                                                .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.30))
                                        }
                                    }
                                    
                                }
                                
                                // OFTEN PICKER
                                if often.isEmpty  { VStack {
                                    HStack {
                                        Text("Select your Answer")
                                            .font(Font.custom("Modern Era", size: 20).weight(.medium))
                                            .lineSpacing(30)
                                            .foregroundColor(.black)
                                            .opacity(often.isEmpty ? 0.2 : 1)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        showPicker2.toggle()
                                    }
                                    
                                    Rectangle()
                                        .padding(.top, 0)
                                        .background(.black)
                                        .frame(height: 1)
                                }
                                .padding(.top, 23)
                                } else{
                                    Text("\(often)")
                                        .font(Font.custom("Modern Era", size: 20).weight(.medium))
                                        .lineSpacing(30)
                                        .padding(20)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                
                                // 実行させたい処理を記載
                                //                                updateProfile(segment: "hometown", value: inputHometown)
                                //                                updateProfile(segment: "faculty", value: faculty)
                                //                                updateProfile(segment: "oftenGo", value: often)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
            .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden(true)
        }
    private func checkAndNavigate(){
        if(!savedHometown.isEmpty && !faculty.isEmpty && !often.isEmpty){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation(.spring()){
                    secondBoardState.state += 1
                }
            }
           
        }
    }
    }

#Preview {
    Onboard4()
}




