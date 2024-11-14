//
//  RegisterC1.swift
//  DTM
//
//  Created by Code Whiz on 11/2/24.
//


import SwiftUI

let genders = ["Man", "Woman", "Beyond Binary"]
let sexualOrientations = ["Men", "Women", "Men & Women", "All Genders"]
let years = ["U1", "U2", "U3", "U4", "U5"]



struct Onboard1: View {
    @State var inputName = ""
    @State private var isInput = false
    @State var gender = ""
    @State var sexualOrientation = ""
    @State var year = ""
    @State private var binaryField = ""
    @State private var binaryVisibility = false
    @State private var customGender = ""
    
    @State private var username: String = ""
    @EnvironmentObject var onboardingState: OnboardState
    
    var now = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        VStack {
            Text("\(now)/3")
                .font(Font.custom("ModernEra-Bold", size: 16).weight(.heavy))
                .foregroundColor(.black)
                .padding(.top, 48)
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(spacing: 0) {
                    Text("I’m a")
                        .font(Font.custom("New York", size: 28).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 0) {
                        ForEach(genders, id: \.self) { gen in
                            optionGender(title: gen, gender: $gender,  isLastOption: gen == genders.last, toggleBinary: $binaryVisibility)
                            if gen != genders.last {
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 28)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 17)
                
                if(binaryVisibility){
                    ZStack(alignment: .leading) {
                        CustomField(
                            text: $binaryField,
                            placeholder: "Specify gender",
                            returnKeyColor: .blue,
                            onSubmit: {
                                customGender = binaryField
                                binaryVisibility = false
                            }
                        )
                        .font(Font.custom("Modern Era", size: 20).weight(.medium))
                        .frame(height: 40)   // Set a fixed height
                        .padding(0)
                        

                        Rectangle()
                            .frame(width: 150, height: 1)
                            .offset(y: 20)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 52)
                    
                 
                } else if(customGender != ""){
                    Text(customGender)
                        .font(Font.custom("Modern Era", size: 20).weight(.medium))
                        .lineSpacing(30)
                        .foregroundColor(.black)
                        .padding(.top, 41)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
                VStack(spacing: 0) {
                    Text("Interested in")
                        .font(Font.custom("New York", size: 28).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 0) {
                        ForEach(sexualOrientations, id: \.self) { sex in
                            if sex != "All Genders" {
                                optionSex(title: sex, sexualOrientation: $sexualOrientation)
                                if sex != "Men & Women" {
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.top, 31)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    optionSex(title: "All Genders", sexualOrientation: $sexualOrientation)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 23)
                }
                .padding(.top, binaryVisibility ? 38 : 70)
//                .padding(.top, 38)
                
                //                MARK: LAST SECTION
                VStack(spacing: 0) {
                    Text("My Year")
                        .font(Font.custom("New York", size: 28).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        ForEach(years, id: \.self) { ye in
                            optionYear(title: ye, callback: checkAndNavigate(), year: $year)
                            if ye != years.last {
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 31)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 75)
                
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
    
    
    
    
    
    
    
    private func checkAndNavigate() {
        if !gender.isEmpty && !sexualOrientation.isEmpty && !year.isEmpty {
            //            updateProfile(segment: "gender", value: gender)
            //            updateProfile(segment: "sexualOrientation", value: sexualOrientation)
            //            updateProfile(segment: "year", value: year)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()){
                    onboardingState.state = 2
                }
            }
            
        }
    }
}

#Preview {
    Onboard1()
}

struct optionGender: View {
    var title: String
    @Binding var gender: String
    var isLastOption: Bool
    @Binding var toggleBinary: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button {
                gender = title
                if isLastOption {
                    toggleBinary.toggle()// Toggle only if it's the last option
                } else {
                    toggleBinary = false // Hide for other options
                }
            } label: {
                Text(title)
                    .font(Font.custom("ModernEra-Medium", size: 16).weight(.medium))
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(gender == title ? Color(red: 0.95, green: 0.52, blue: 0.66) : Color(red: 0.93, green: 0.93, blue: 0.93))
                    .cornerRadius(20)
            }
        }
    }
}

struct optionSex: View {
    var title: String
    @State var gateColor = true
    @Binding var sexualOrientation: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button {
                gateColor.toggle()
                sexualOrientation = title
            } label: {
                Text(title)
                    .font(Font.custom("ModernEra-Medium", size: 16).weight(.medium))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(sexualOrientation == title ? Color(red: 0.95, green: 0.52, blue: 0.66) : Color(red: 0.93, green: 0.93, blue: 0.93))
        .cornerRadius(40)
    }
}

struct optionYear: View {
    var title: String
    var callback: () // Added callback parameter
    @State var gateColor = true
    @Binding var year: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button {
                gateColor.toggle()
                year = title
                callback
            } label: {
                Text(title)
                    .font(Font.custom("ModernEra-Medium", size: 16).weight(.medium))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(year == title ? Color(red: 0.95, green: 0.52, blue: 0.66) : Color(red: 0.93, green: 0.93, blue: 0.93))
        .cornerRadius(40)
    }
}



