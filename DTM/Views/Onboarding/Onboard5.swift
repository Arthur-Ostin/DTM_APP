//
//  RegisterC4.swift
//  DTM
//
//  Created by 水野裕介 on 2024/06/23.
//
//  Modified by Code Whiz

import SwiftUI


struct Onboard5: View {
    @State var inputMusic = ""
    @State private var isInput = false
    @State var option1 = ""
    @State var option2 = ""
    @State var musicGenre0 = [""]
    @State private var specify = false
    @State private var now = 1
    
    @EnvironmentObject var secondBoardState: SecondBoardState
    
    var isNextEnabled: Bool {
        !option1.isEmpty && !option2.isEmpty
    }
    
    public var body: some View {
        VStack(spacing:0) {
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
            
            // Custom progress bar
            ProgressBar(now: $now)
            // Number
            Text("\(now)/2")
                .font(Font.custom("ModernEra-Bold", size: 16).weight(.heavy))
                .foregroundColor(.black)
                .padding(.top, 20)
            
            VStack(alignment: .leading) {
                ScrollView {
                    // What music do you like?
                    HStack(spacing: 0) {
                        Text("2 music genres you like")
                            .font(
                                Font.custom("New York", size: 28)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(height: 20, alignment: .topLeading)
                            .padding(.top, 18)
                        
                        Spacer()
                    }
                    // Add Space
                    // Genre List
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            ForEach(musicGenre1, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre1.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 15)
                        HStack(spacing: 0) {
                            ForEach(musicGenre2, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre2.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 15)
                        HStack(spacing: 0) {
                            ForEach(musicGenre3, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre3.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 15)
                        HStack(spacing: 0) {
                            ForEach(musicGenre4, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre4.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 36)
                        HStack(spacing: 0) {
                            ForEach(musicGenre5, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre5.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 15)
                        HStack(spacing: 0) {
                            ForEach(musicGenre6, id: \.self) { gen in
                                SelectOption(
                                    title: gen,
                                    option1: $option1,
                                    option2: $option2
                                )
                                if gen != musicGenre6.last {
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 15)
                        
                        
                        // Custom genres in musicGenre0 with removal functionality
                        HStack(spacing: 14) {
                            ForEach(musicGenre0, id: \.self) { genre in
                                SelectOption(
                                    title: genre,
                                    option1: $option1,
                                    option2: $option2,
                                    onRemove: {
                                        // Remove genre from musicGenre0 when "X" button is tapped
                                        if let index = musicGenre0.firstIndex(of: genre) {
                                            musicGenre0.remove(at: index)
                                        }
                                    }
                                )
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 15)
                        
                        
                    }
                    .padding(.top, 60)
                    
                }
                AddOption(
                    specify: $specify,
                    inputText: $inputMusic,
                    options: $musicGenre0,
                    placeholder: "Type genre"
                )
                Spacer()
                
                // Next
                NextButton(
                    state: 6,
                    isNextEnabled: isNextEnabled,
                    now: $now,
                    customAction: {
                        withAnimation(.spring()){
                            secondBoardState.state += 1
                        }
                    }
                )
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboard5()
}

