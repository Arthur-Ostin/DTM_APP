//
//  Optionoption.swift
//  DTM
//
//  Created by Code Whiz on 11/11/24.
//

import SwiftUI

//struct SelectOption: View {
//    var title: String
//    @Binding var option1: String
//    @Binding var option2: String
//    var onRemove: (() -> Void)? // Optional closure for custom option removal
//    var onTap: (() -> Void)? // Optional closure for selection action
//
//    var body: some View {
//        if !title.isEmpty {
//            HStack {
//                Button {
//                    // Toggle selection
//                    if option1 == title {
//                        option1 = ""
//                        onTap?() // Call onTap to trigger deselection
//                    } else if option2 == title {
//                        option2 = ""
//                        onTap?()
//                    } else if option1.isEmpty {
//                        option1 = title
//                        onTap?()
//                    } else if option2.isEmpty {
//                        option2 = title
//                        onTap?()
//                    } else {
//                        option1 = option2
//                        option2 = title
//                        onTap?()
//                    }
//                } label: {
//                    ZStack(alignment: .topTrailing) {
//                        Text(title)
//                            .font(Font.custom("ModernEra-Medium", size: 14).weight(.medium))
//                            .foregroundColor(.black)
//                            .padding(8)
//                            .background((option1 == title || option2 == title) ? Constants.SelectedColour : Constants.BackgoroundGrey)
//                            .cornerRadius(10)
//
//                        // Show "X" button for custom options only
//                        if let onRemove = onRemove {
//                            Button(action: onRemove) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .foregroundColor(.white)
//                                    .background(.black)
//                                    .clipShape(Circle())
//                                    .padding(.leading, 4)
//                                    .font(Font.custom("Modern Era", size: 10))
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct SelectOption: View {
//    var title: String
//    @Binding var option1: String
//    @Binding var option2: String
//    var onRemove: (() -> Void)? // Optional closure for removal action
//    var onTap: (() -> Void)? // Optional closure for selection action
//
//    var body: some View {
//        if !title.isEmpty {
//            HStack {
//                Button {
//                    // Toggle selection
//                    if option1 == title {
//                        option1 = ""
//                        onTap?() // Call onTap to trigger deselection
//                    } else if option2 == title {
//                        option2 = ""
//                        onTap?()
//                    } else if option1.isEmpty {
//                        option1 = title
//                        onTap?()
//                    } else if option2.isEmpty {
//                        option2 = title
//                        onTap?()
//                    } else {
//                        option1 = option2
//                        option2 = title
//                        onTap?()
//                    }
//                } label: {
//                    ZStack(alignment: .topTrailing) {
//                        Text(title)
//                            .font(Font.custom("ModernEra-Medium", size: 14).weight(.medium))
//                            .foregroundColor(.black)
//                            .padding(8)
//                            .background((option1 == title || option2 == title) ? Constants.SelectedColour : Constants.BackgoroundGrey)
//                            .cornerRadius(10)
//
//                        // Show "X" button only if the option is selected
//                        if (option1 == title || option2 == title), let onRemove = onRemove {
//                            Button(action: onRemove) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .foregroundColor(.white)
//                                    .background(.black)
//                                    .clipShape(Circle())
//                                    .padding(.leading, 4)
//                                    .font(Font.custom("Modern Era", size: 10))
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
struct SelectOption: View {
    var title: String
    @Binding var option1: String
    @Binding var option2: String
    var onRemove: (() -> Void)? // Optional closure for removal action
    var onTap: (() -> Void)? // Optional closure for selection action

    var body: some View {
        if !title.isEmpty {
            HStack {
                Button {
                    // Toggle selection
                    if option1 == title {
                        option1 = ""
                        onTap?() // Call onTap to trigger deselection
                    } else if option2 == title {
                        option2 = ""
                        onTap?()
                    } else if option1.isEmpty {
                        option1 = title
                        onTap?()
                    } else if option2.isEmpty {
                        option2 = title
                        onTap?()
                    } else {
                        option1 = option2
                        option2 = title
                        onTap?()
                    }
                } label: {
                    ZStack(alignment: .topTrailing) {
                        Text(title)
                            .font(Font.custom("ModernEra-Medium", size: 14).weight(.medium))
                            .foregroundColor(.black)
                            .padding(8)
                            .background((option1 == title || option2 == title) ? Constants.SelectedColour : Constants.BackgoroundGrey)
                            .cornerRadius(10)

                        // Show "X" button only if the option is selected
                        if option1 == title || option2 == title {
                            Button(action: {
                                if let onRemove = onRemove {
                                    onRemove() // Trigger onRemove if specified
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .clipShape(Circle())
                                    .padding(.leading, 4)
                                    .font(Font.custom("Modern Era", size: 10))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview{
    Onboard5()
}
