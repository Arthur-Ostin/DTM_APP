//
//  RegisterC6_1.swift
//  DTM
//
//  Created by 水野裕介 on 2024/06/23.
//
// Modified by CodeWhiz

import SwiftUI


struct Onboard7_1: View {
    @State private var inputReason1 = ""
    @State private var now = 3
    @State private var isSheetPresented = false
    @State private var selectedPrompt: String = "You’ll just have to meet me to find out about"
    @State private var prompts = [
        "You’ll just have to meet me to find out about...",
        "Want to be shocked? Ask me about...",
        "I will tell you the best place at McGill to...",
        "My ideal date involves...",
        "On the date I’ll steer the convo towards..."
    ]
    
    var isNextEnabled: Bool {
        // Return true if there are at least 10 characters in the text box
        return inputReason1.count >= 10
    }
    
    var remainingCharacters: Int {
        // Calculate remaining characters for the 110-character limit
        max(0, 110 - inputReason1.count)
    }
    
    @EnvironmentObject var onboardingState: OnboardState
    
    public var body: some View {
        VStack {
            NavigationLink {
                // Navigate to another view
            } label: {
                Text("Complete later")
                    .font(Font.custom("ModernEra-Medium", size: 12).weight(.bold))
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 32)
                    .padding(.top, 16)
            }
            
            ProgressBar(now: $now)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Prompt 1")
                    .font(Font.custom("New York", size: 28).weight(.bold))
                    .lineSpacing(42)
                    .padding(.top, 50.23)
                    .foregroundColor(.black)
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    HStack {
                        Text(selectedPrompt)
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("Modern Era", size: 16).weight(.bold))
                            .lineSpacing(14)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 36)
                .sheet(isPresented: $isSheetPresented) {
                    PromptsSheetView(selectedPrompt: $selectedPrompt, prompts: prompts)
                }
                
                VStack(spacing: 0) {
                    CustomTextView(text: $inputReason1, placeholder: "Type response here")
                        .frame(height: 120)
                        .onChange(of: inputReason1) { newValue in
                            // Limit input to 110 characters
                            if newValue.count > 110 {
                                inputReason1 = String(newValue.prefix(110))
                            }
                        }
                    
                    // Show remaining characters countdown in the bottom-right corner
                    if remainingCharacters < 31  {
                        Text("\(remainingCharacters)")
                            .font(Font.custom("Modern Era", size: 14).weight(.bold))
                            .lineSpacing(21)
                            .foregroundColor(Color(red: 1, green: 0.75, blue: 0.03))
                        
                        .frame(maxWidth: .infinity, alignment: .trailing)}
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1)
                        .opacity(0.1)
                )
                
                Spacer()
                
                // Next Button
                NextButton(state: 8, isNextEnabled: isNextEnabled, now: $now)
            }
            .padding(.top, 50)
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            // Dismiss the keyboard when tapping outside the text field
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    Onboard7_1()
}
