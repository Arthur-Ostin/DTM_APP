//
//  PromptsView.swift
//  DTM
//
//  Created by Code Whiz on 11/11/24.
//

import SwiftUI


//struct PromptsSheetView: View {
//    @Environment(\.dismiss) var dismiss
//    @Binding var selectedPrompt: String
//    
//    var body: some View {
//        VStack {
//            Text("Prompts (1)")
//                .font(.headline)
//                .padding(.top, 20)
//            
//            Divider()
//                .padding(.horizontal)
//            
//            ScrollView {
//                VStack {
//                    PromptCard(text: "You’ll just have to meet me to find out about...", selectedPrompt: $selectedPrompt, onSelected: handleSelection)
//                    PromptCard(text: "Want to be shocked? Ask me about...", selectedPrompt: $selectedPrompt, onSelected: handleSelection)
//                    PromptCard(text: "I will tell you the best place at McGill to...", selectedPrompt: $selectedPrompt, onSelected: handleSelection)
//                    PromptCard(text: "My ideal date involves...", selectedPrompt: $selectedPrompt, onSelected: handleSelection)
//                    PromptCard(text: "On the date I’ll steer the convo towards...", selectedPrompt: $selectedPrompt, onSelected: handleSelection)
//                }
//                .padding()
//            }
//            .scrollIndicators(.hidden)
//        }
//    }
//    
//    private func handleSelection() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            dismiss()
//        }
//    }
//}
//
//struct PromptCard: View {
//    var text: String
//    @Binding var selectedPrompt: String
//    var onSelected: () -> Void
//    
//    var isSelected: Bool {
//        selectedPrompt == text
//    }
//    
//    var body: some View {
//        VStack {
//            Text(text)
//                .font(.custom("Modern Era", size: 18).weight(.bold))
//                .foregroundColor(.black)
//                .multilineTextAlignment(.center)
//                .lineSpacing(5)
//                .padding(.horizontal, 25)
//                .frame(width: 296, height: 80)
//                .background(Color.white)
//                .cornerRadius(20)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(isSelected ? Color(red: 0.89, green: 0.17, blue: 0.3) : Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
//                )
//                .shadow(color: isSelected ? Color.black.opacity(0.2) : Color.clear, radius: 4, y: 2)
//                .onTapGesture {
//                    // Set the selected prompt without ellipses
//                    selectedPrompt = text.trimmingCharacters(in: CharacterSet(charactersIn: "."))
//                    onSelected()
//                }
//        }
//        .padding(.bottom, 48)
//    }
//}

struct PromptsSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedPrompt: String
    var prompts: [String] // Array to hold dynamic prompt texts
    
    var body: some View {
        VStack {
            Text("Prompts")
                .font(.headline)
                .padding(.top, 20)
            
            Divider()
                .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(prompts, id: \.self) { prompt in
                        PromptCard(text: prompt, selectedPrompt: $selectedPrompt, onSelected: handleSelection)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func handleSelection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            dismiss()
        }
    }
}

struct PromptCard: View {
    var text: String
    @Binding var selectedPrompt: String
    var onSelected: () -> Void
    
    var isSelected: Bool {
        selectedPrompt == text
    }
    
    var body: some View {
        VStack {
            Text(text)
                .font(.custom("Modern Era", size: 18).weight(.bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.horizontal, 25)
                .frame(width: 296, height: 80)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color(red: 0.89, green: 0.17, blue: 0.3) : Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
                .shadow(color: isSelected ? Color.black.opacity(0.2) : Color.clear, radius: 4, y: 2)
                .onTapGesture {
                    selectedPrompt = text.trimmingCharacters(in: CharacterSet(charactersIn: "."))
                    onSelected()
                }
        }
        .padding(.bottom, 48)
    }
}
