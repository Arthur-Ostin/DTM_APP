//
//  RegisterC1_2.swift
//  DTM
//
//  Created by 水野裕介 on 2024/07/07.
//
//  Modified by Code Whiz




import SwiftUI

struct Onboard3: View {
    @State var height = ""
    var now = 3
    @State private var isButton = false
    @State private var navigateToTonight = false // New state variable for navigation

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("\(now)/3")
                    .font(Font.custom("ModernEra-Bold", size: 16).weight(.heavy))
                    .foregroundColor(.black)
                    .padding(.top, 48)
                
                // Height
                VStack(spacing: 0) {
                    Text("Your Height")
                        .font(Font.custom("New York", size: 28).weight(.bold))
                        .foregroundColor(.black)
                        .frame(height: 20, alignment: .leading)
                        .padding(.top, 60)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 26)
                
                HeightPickerView(isButton: $isButton)
                
                // "Done" button to trigger navigation
                Button(action: {
                    if isButton {
                        navigateToTonight = true
                    }
                }) {
                    Text("Done")
                        .font(Font.custom("Modern Era", size: 18).weight(.bold))
                        .lineSpacing(27)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 18, leading: 40, bottom: 18, trailing: 40))
                        .frame(width: 124, height: 49)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: isButton
                                                   ? [Color(red: 0.89, green: 0.17, blue: 0.30), Color(red: 0.91, green: 0.17, blue: 0.30), Color(red: 0.60, green: 0.09, blue: 0.25)]
                                                   : [Color(red: 0.93, green: 0.93, blue: 0.93)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(33)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 6, y: 4
                        )
                }
                .disabled(!isButton) // Disable button if `isButton` is false
                .background(
                    NavigationLink(
                        destination: TonightView(), // Replace with your actual TonightView
                        isActive: $navigateToTonight,
                        label: { EmptyView() } // Hidden NavigationLink
                    )
                )
                .padding(.bottom, 248)
                .padding(.horizontal, 135)
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

#Preview {
    Onboard3()
}

struct HeightPickerView: View {
    // Range of heights
    let heights = Array(150...200) // adjust this as needed
    @State private var selectedHeight = 170 // default selected value
    @Binding var isButton: Bool

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.size.width - 18, height: 32)
                    .foregroundColor(.clear)
                VStack(spacing: 0) {
                    Picker(selection: $selectedHeight, label: Text("")) {
                        ForEach(heights, id: \.self) { height in
                            VStack {
                                if height == selectedHeight {
                                    Divider()
                                        .frame(height: 2)
                                        .background(Color.black)
                                }
                                ZStack {
                                    Text("\(height) \(height == selectedHeight ? "cm" : "")")
                                        .font(.system(size: height == selectedHeight ? 24 : 20, weight: height == selectedHeight ? .bold : .regular))
                                        .foregroundColor(.black)
                                        .frame(width: geometry.size.width, height: 20, alignment: .center)
                                        .padding(.trailing, height != selectedHeight ? 40 : 0)
                                }
                                if height == selectedHeight {
                                    Divider()
                                        .frame(height: 2)
                                        .background(Color.black)
                                }
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 322)
                    .onChange(of: selectedHeight) { newValue in
                        isButton = true
                    }
                }
            }
        }
    }
}
