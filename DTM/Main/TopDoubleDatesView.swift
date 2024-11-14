//
//  TopDoubleDatesView.swift
//  DTM
//
//  Created by 水野裕介 on 2024/07/12.
//

import SwiftUI
import MapKit

//struct MapFeature {
//    let id: UUID
//    let title: String
//    let coordinate: CLLocationCoordinate2D
//}


struct TopDoubleDatesView: View {
    @Binding var data: [String]
    
    @State var sectionData = ["Tuesday","17th Sep","21:00","22:30","Barbossa",""]
    @State private var inputSign = false
    @State private var isChange = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("McGill Double Dates ")
                        .font(
                            Font.custom("ModernEra-Medium", size: 24)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 60)
                HStack(spacing: 0) {
                    Text("Next event:")
                        .font(
                            Font.custom("ModernEra-Medium", size: 14)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.03, green: 0.23, blue: 0.17))
                    Spacer()
                }
                .padding(.top, 48)
                VStack(alignment: .center, spacing: 20) {
                    Text("🎉 \(sectionData[0] + ", " + sectionData[1]), 2024 🎉")
                        .font(
                            Font.custom("ModernEra-Medium", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 358, alignment: .top)
                    Text("Spaces: 27 / 170")
                        .font(Font.custom("SF Pro", size: 14))
                        .foregroundColor(.black)
                        .frame(width: 110, alignment: .topLeading)
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Text("How it works")
                                .font(
                                    Font.custom("Modern Era", size: 14)
                                        .weight(.bold)
                                )
                            Image(systemName: "info.circle")
                                .frame(width: 15, height: 15)
                                .padding(.leading, 6)
                        }
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.3))
                    }
                }
                    .padding(20)
                    .frame(width: 358, alignment: .center)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 1)
                    )
                    .padding(.top, 16)
                
                Spacer()
                
                if sectionData[5] != "none" {
                    Button {
                        inputSign = true
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            // Small text
                            Text("Sign Up")
                                .font(
                                    Font.custom("ModernEra-Medium", size: 16)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 76, alignment: .top)
                        }
                            .padding(.leading, 52)
                            .padding(.trailing, 51)
                            .padding(.vertical, 12)
                            .frame(width: 179, height: 48, alignment: .center)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.89, green: 0.17, blue: 0.3), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.91, green: 0.17, blue: 0.3), location: 0.35),
                                        Gradient.Stop(color: Color(red: 0.83, green: 0.13, blue: 0.35), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                            .cornerRadius(30)
                    }
                    .fullScreenCover(isPresented: $inputSign) {
                        signUpBro(data: $data)
                    }
                } else {
                    Text("\(sectionData[5]) must click the link sent to their email to confirm your place")
                        .font(
                            Font.custom("SF Pro", size: 16)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 318, alignment: .top)
                    Spacer()
                    Image("dots")
                        .frame(width: 37, height: 5)
                    Spacer()
                    HStack {
                        Text("\(broName)@mail.mcgill.ca")
                            .font(
                                Font.custom("SF Pro", size: 15)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.46, green: 0.47, blue: 0.47))
                        Button {
                            isChange.toggle()
                        } label: {
                            Text("Change")
                                .font(
                                    Font.custom("Modern Era", size: 14)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.89, green: 0.17, blue: 0.3))
                        }
                        .fullScreenCover(isPresented: $isChange) {
                            ChangeFriend()
                        }
                    }
                        .frame(width: 257, height: 11)
                }
                Spacer()
            }
            
            .padding(.horizontal, 18)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 194)
                .background(
                    Image("sitt")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393, height: 194)
                        .clipped()
                )
            
            Divider()
                .padding(.horizontal, 15)
                .padding(.bottom, 8)
                .padding(.top, 20)
        }
        .task {
            Task {
                do {
                    var parts = data[0].split(separator: " ")
                    if parts == [] {
                        parts.append("Thursday")
                        parts.append("Sep")
                        parts.append("19th")
                        parts.append("21:00")
                        parts.append("22:30")
                    }
                    print(parts)
                    sectionData[0] = String(parts[0])
                    sectionData[1] = parts[2] + " " + parts[1]
                    sectionData[2] = String(parts[3])
                    sectionData[3] = String(parts[4])
                    sectionData[4] = data[1]
                    checkSend(name: userName) { judge in
                        sectionData[5] = judge
                        var t = ""
                        if judge != "none" {
                            t = String((judge.split(separator: "."))[0])
                            sectionData[5] = t
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

#Preview {
    TopDoubleDatesView(data: Binding<[String]>.constant(["Tuesday Sep 17th 21:00 22:30","Barbossa"]))
}

struct ChangeFriend: View {
    var body: some View {
        Color.gray.opacity(0.1)
        .onTapGesture {
            
        }
        ZStack {
            Text("Change Friend/Email")
                .font(
                    Font.custom("New York", size: 18)
                        .weight(.bold)
                )
                .foregroundColor(.black)
            Text("\(broName)@mail.mcgill.ca")
                .font(
                    Font.custom("SF Pro", size: 14)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.46, green: 0.47, blue: 0.47))
                .frame(width: 211, height: 10, alignment: .top)
            Button {
                doubleDelete(name: broName)
            } label:{
                HStack(alignment: .center, spacing: 0) {
                    Text("Confirm change")
                        .font(
                            Font.custom("Inter", size: 13.33333)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 108.33334, alignment: .top)
                }
                    .padding(.leading, 20.83333)
                    .padding(.trailing, 20)
                    .padding(.vertical, 10)
                    .frame(width: 149.16667, height: 40, alignment: .center)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.89, green: 0.17, blue: 0.3), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.91, green: 0.17, blue: 0.3), location: 0.35),
                                Gradient.Stop(color: Color(red: 0.83, green: 0.13, blue: 0.35), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    )
                    .cornerRadius(8.33333)
            }
        }
            .frame(width: 322, height: 153)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.93), lineWidth: 1)
            )    }
}
