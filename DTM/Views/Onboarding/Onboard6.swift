//
//  Onboard.swift
//  DTM
//
//  Created by Code Whiz on 11/10/24.
//



import SwiftUI





struct Onboard6: View {
    
    @State private var now = 2
    @State var inputPassion = ""
    @State var customPassion = [""]
    @State private var specify = false
    @State private var selectedCount = 0
    @State private var option1 = ""
    @State private var option2 = ""
    
    @State private var expandedCategories: [String: Bool] = [
        "Social": false,
        "Interests": false,
        "Activities": false,
        "Sports": false
    ]
    
    @State private var selectedOptions: [String: Set<String>] = [
        "Social": [],
        "Interests": [],
        "Activities": [],
        "Sports": []
    ]
    
    var isNextEnabled: Bool {
        selectedCount > 0 // Enable based on selection count or other criteria
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Spacer()
                    Text("Complete later")
                        .font(Font.custom("Modern Era", size: 12).weight(.bold))
                        .foregroundColor(Color(red: 0.10, green: 0.20, blue: 0.45))
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
                // Custom progress bar
                ProgressBar(now: $now)
                
                // Title and subtitle
                Text("3 or 4 Passions")
                    .font(Font.custom("New York", size: 28).weight(.bold))
                    .lineSpacing(42)
                    .foregroundColor(.black)
                    .frame(height: 20)
                    .padding(.leading, 31)
                    .padding(.top, 48)
                
                Text("\(selectedCount)/4 Selected")
                    .font(Font.custom("Modern Era", size: 14).weight(.medium))
                    .lineSpacing(14)
                    .foregroundColor(.black)
                    .frame(width: 82, height: 14)
                    .padding(.top, 36)
                    .padding(.horizontal, 155)
                
                // List of categories
                VStack(alignment: .leading, spacing: 53) {
                    CategoryRow(
                        icon: "figure.socialdance",
                        text: "Social",
                        isSystemIcon: true,
                        isExpanded: $expandedCategories["Social"],
                        selectedOptions: $selectedOptions["Social"],
                        selectedCount: $selectedCount,
                        totalCount: 4,
                        options: socialOptions
                    )
                    CategoryRow(
                        icon: "book",
                        text: "Interests",
                        isSystemIcon: true,
                        isExpanded: $expandedCategories["Interests"],
                        selectedOptions: $selectedOptions["Interests"],
                        selectedCount: $selectedCount,
                        totalCount: 4,
                        options: interestOptions
                    )
                    CategoryRow(
                        icon: "shoe-trek",
                        text: "Activities",
                        isSystemIcon: false,
                        isExpanded: $expandedCategories["Activities"],
                        selectedOptions: $selectedOptions["Activities"],
                        selectedCount: $selectedCount,
                        totalCount: 4,
                        options: activitiesOptions
                    )
                    CategoryRow(
                        icon: "base-ball",
                        text: "Sports",
                        isSystemIcon: false,
                        isExpanded: $expandedCategories["Sports"],
                        selectedOptions: $selectedOptions["Sports"],
                        selectedCount: $selectedCount,
                        totalCount: 4,
                        options: sportsOptions
                    )
                    HStack(spacing: 14) {
                        ForEach(customPassion, id: \.self) { passion in
                            SelectOption(
                                title: passion,
                                option1: $option1,
                                option2: $option2,
                                onRemove: {
                                    // Remove custom passion and decrement count
                                    if let index = customPassion.firstIndex(of: passion) {
                                        customPassion.remove(at: index)
                                        selectedCount -= 1
                                    }
                                }
                            )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 15)
                }
                .padding(.leading, 35)
                .padding(.trailing, 33)
                .padding(.top, 20)
                
                // Other/specify button
                AddOption(
                    specify: $specify,
                    inputText: $inputPassion,
                    options: $customPassion,
                    placeholder: "Type genre"
                )
                .padding(.top, 104)
                .padding(.leading, 46)
                
                Spacer()
                
                // Next button
                NextButton(state: 7, isNextEnabled: isNextEnabled, now: $now)
                    .padding(.trailing, 16)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .scrollIndicators(.hidden)
    }
    
    struct CategoryRow: View {
        let icon: String
        let text: String
        let isSystemIcon: Bool
        @Binding var isExpanded: Bool?
        @Binding var selectedOptions: Set<String>?
        @Binding var selectedCount: Int
        let totalCount: Int
        var options: [String]
        
        @State private var option1 = ""
        @State private var option2 = ""
        
        private let maxItemsPerRow = 4
        
        var body: some View {
            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isExpanded?.toggle()
                    }
                }) {
                    HStack {
                        if isSystemIcon {
                            Image(systemName: icon)
                                .font(.title2)
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                        } else {
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        Text(text)
                            .font(Font.custom("Modern Era", size: 20).weight(.bold))
                            .lineSpacing(30)
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        // Red dots to indicate selected options
                        HStack(spacing: 2) {
                            ForEach(0..<(selectedOptions?.count ?? 0), id: \.self) { _ in
                                Circle()
                                    .frame(width: 6, height: 6)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(isExpanded == true ? 180 : 0))
                            .foregroundColor(.black)
                    }
                }
                
                if isExpanded == true {
                    ForEach(splitOptionsIntoRows(options: options, maxItems: maxItemsPerRow), id: \.self) { rowOptions in
                        HorizontalOptionsView(
                            options: rowOptions,
                            option1: $option1,
                            option2: $option2,
                            selectedOptions: $selectedOptions,
                            selectedCount: $selectedCount,
                            totalCount: totalCount
                        )
                    }
                }
            }
        }
        
        private func splitOptionsIntoRows(options: [String], maxItems: Int) -> [[String]] {
            stride(from: 0, to: options.count, by: maxItems).map {
                Array(options[$0..<min($0 + maxItems, options.count)])
            }
        }
    }
}




struct HorizontalOptionsView: View {
    let options: [String]
    @Binding var option1: String
    @Binding var option2: String
    @Binding var selectedOptions: Set<String>?
    @Binding var selectedCount: Int
    let totalCount: Int
    private let maxSelectionsPerCategory = 2 // Maximum selections per category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    SelectOption(
                        title: option,
                        option1: $option1,
                        option2: $option2,
                        onTap: {
                            if selectedOptions?.contains(option) == true {
                                // Remove option if it’s already selected
                                selectedOptions?.remove(option)
                                selectedCount -= 1
                            } else if selectedCount < 4 && (selectedOptions?.count ?? 0) < maxSelectionsPerCategory {
                                // Add option if within total and per-category limit
                                selectedOptions?.insert(option)
                                selectedCount += 1
                            }
                            print(selectedOptions ?? [])
                        }
                    )
                    if option != options.last {
                        Spacer()
                    }
                }
            }
        }
        .frame(height: 40)
        .padding(.top, 15)
    }
}


#Preview{
    Onboard6()
}
