//
//  TermsView.swift
//  DTM
//
//  Created by Code Whiz on 11/1/24.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.dismiss) var dismiss
    
    var userItems: [String] = [
        "Prohibited Activities: Users agree not to engage in harassment, abuse, inappropriate content sharing, unauthorized use of others' information, or any other conduct that violates these terms or any applicable law.",
        "Reporting and Blocking: Users may report inappropriate behavior or block other users. Down to Meet reserves the right to investigate reports and take appropriate action, including account suspension or termination.",
        "Safety Precautions: Users are encouraged to take safety precautions when meeting in person, such as meeting in public places and informing someone they are meeting someone."
    ]
    var dataItems: [String] = [
        "Data Sharing: Down to Meet does not share user data with any third parties. Your personal information is kept confidential and used only within the app to facilitate matchmaking and social interaction.",
        "Data Visibility: Depending on the nature of the information uploaded (e.g., profile information, pictures, interests), some or all of this information may be visible to other users of the app.",
        "Data Retention: Down to Meet retains user data for the duration of the user's account activity.",
        "Right to Delete Data: Users have the right to request the deletion of their personal data at any time. Upon such a request, Down to Meet will permanently delete all personal data associated with the user's within 30 days.",
        "Compliance with Quebec Data Protection Laws: Down to Meet complies with all applicable data protection laws in Quebec, including the Act Respecting the Protection of Personal Information in the Private Sector."
    ]
    var contentItems: [String] = [
        "Intellectual Property: All intellectual property related to the app (branding, design, code, etc.) is owned by Down to Meet and may not be used without permission."
    ]
    
    var feesItems: [String] = [
        "Payments: Down to Meet reserves the right to block user accounts if they fail to attend a meet-up. A $45 fee will be required to unblock the account. If a user cancels twice, they will be required to pay a $5 fee. All fees must be paid to restore account access.",
        "Disputes: Users may contact support for payment disputes. Down to Meet reserves the right to review the payment dispute and will respond to users within a reasonable time period."
    ]
    
    var terminationItems: [String] = [
        "Appeals Process: Users may appeal account suspensions or terminations by contacting customer support. Down to Meet will review the appeal and make a final decision."
    ]
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0){
                    // Title Bar
                    HStack (alignment: .center){
                        Text("Terms of use")
                            .font(Font.custom("Modern Era", size: 24).weight(.bold))
                            .lineSpacing(36)
                            .foregroundColor(.black)
                            .frame(width: 219)
                            .padding(.leading, 87)
                            .padding(.trailing, 51)
                        
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark").fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(20)
                    
                    Divider()
                        .padding(.bottom,20)
                    // first section
                    VStack(alignment: .leading){
                        Text("User Eligibility")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("By using Down to Meet, you confirm that you are at least 18 years old and currently enrolled in a recognised university. You agree to provide accurate and truthful information during the registration process and understand that your account may be terminated if false information is provided.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // SECOND SECTION USER RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("User Responsibility and Conduct")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Down to Meet assumes no responsibility or liability for any conduct or content of any user of the app or for any interactions that may occur between users. Users acknowledge and agree that they use the app and engage with other users at their own risk.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 28)
                    // list
                    ForEach(0..<userItems.count, id: \.self) { index in
                        let parts = userItems[index].split(separator: ":", maxSplits: 1)
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .italic(true)
                            (Text(parts[0]).italic(true) + Text(":\(parts.count > 1 ? parts[1] : "")"))
                        }
                        .lineSpacing(10)
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .padding(.bottom, 28)
                    }
                    
                    
                    // THIRD SECTION
                    VStack(alignment: .leading){
                        Text("Limitation of Liability")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Down to Meet does not assume liability for the functionality, availability or performance of the app. Any in-person meetings are conducted at the user's own personal risk. Down to Meet will reasonably endeavor to ensure that the platform is safe, however does not assume liability for any events that happen during in-person meetings, including double dates")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // FOURTH SECTION
                    VStack(alignment: .leading){
                        Text("Indemnification")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("The User agrees to indemnify and hold harmless Down to Meet against any claims, damages, or liabilities arising out of failure to use the app in accordance with these terms and conditions and any material breaches of their obligations under these terms and conditions.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // FIFTH SECTION DATA
                    VStack(alignment: .leading){
                        Text("Data Policy")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("By uploading personal information, users consent to Down to Meet collecting, storing, and processing their personal information solely for the purposes of providing matchmaking services, improving user experience, and for analytical purposes.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 28)
                    // list
                    ForEach(0..<dataItems.count, id: \.self) { index in
                        let parts = dataItems[index].split(separator: ":", maxSplits: 1)
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .italic(true)
                            (Text(parts[0]).italic(true) + Text(":\(parts.count > 1 ? parts[1] : "")"))
                        }
                        .lineSpacing(10)
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .padding(.bottom, 28)
                    }
                    
                    // SIXTH SECTION USER CONTENT
                    VStack(alignment: .leading){
                        Text("User Content and Intellectual Property")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Users retain ownership of the content they upload but grant Down to Meet a royalty-free, non-transferable, and exclusive license to use, display, and distribute their content for app-related purposes.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 28)
                    // list
                    ForEach(0..<contentItems.count, id: \.self) { index in
                        let parts = contentItems[index].split(separator: ":", maxSplits: 1)
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .italic(true)
                            (Text(parts[0]).italic(true) + Text(":\(parts.count > 1 ? parts[1] : "")"))
                        }
                        .lineSpacing(10)
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .padding(.bottom, 28)
                    }
                    
                    // SIXTH SECTION FEES
                    VStack(alignment: .leading){
                        Text("Fees and Payment Terms")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("All fees paid are non-refundable. However, in the event of an error or technical issue on our part, refunds will be issued at the sole discretion of Down to Meet.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 28)
                    // list
                    ForEach(0..<feesItems.count, id: \.self) { index in
                        let parts = feesItems[index].split(separator: ":", maxSplits: 1)
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .italic(true)
                            (Text(parts[0]).italic(true) + Text(":\(parts.count > 1 ? parts[1] : "")"))
                        }
                        .lineSpacing(10)
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .padding(.bottom, 28)
                    }
                    
                    
                    // SEVENTH SECTION TERMINATION
                    VStack(alignment: .leading){
                        Text("Termination and Suspension of Accounts")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Down to Meet reserves the right to terminate or suspend any account at its discretion, including for non-payment of fines, violation of these terms, or prolonged inactivity.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 28)
                    // list
                    ForEach(0..<terminationItems.count, id: \.self) { index in
                        let parts = terminationItems[index].split(separator: ":", maxSplits: 1)
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .italic(true)
                            (Text(parts[0]).italic(true) + Text(":\(parts.count > 1 ? parts[1] : "")"))
                        }
                        .lineSpacing(10)
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .leading)
                        .padding(.bottom, 28)
                    }
                    
                    // EIGTH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("User Responsibility for Reviewing Terms")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("It is the continual responsibility of the user to regularly review these terms and conditions to stay informed of any updates or changes. Down to Meet reserves the right to modify these terms at any time without prior notice. Continued use of the app following any changes to the terms and conditions constitutes your acceptance of those changes. Users who do not agree to the updated terms should discontinue using the app immediately.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // NINETH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("Amendments to Terms and Conditions")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Down to Meet reserves the right to amend, modify, or update these terms and conditions at any time, at its sole discretion, without prior notice to users. Continued use of the app after any such amendments or modifications constitutes your acceptance of the updated terms. Users are responsible for regularly reviewing the terms to stay informed of any changes.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    
                    // TENTH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("Confidentiality Clause")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Users agree to maintain the confidentiality of personal information, user communications, and any other sensitive information obtained through Down to Meet. This obligation includes, but is not limited to, not sharing profile details, messages, or any other user-specific information with third parties, unless explicitly allowed by the user or required by law.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // ELEVENTH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("Third-Party Rights")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("Nothing in these terms and conditions shall confer or purport to confer any third-party rights. The agreement is between Down to Meet and its users, and no third party shall have the right to enforce any of the provisions contained herein.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // TWELFTH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("Dispute Resolution")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("In the event of a dispute between you and Down to Meet, you agree to first engage in good-faith negotiations. If the dispute cannot be resolved, it will be referred to binding arbitration in Quebec under the applicable laws of Quebec.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    // THIRTEENTH SECTION RESPONSIBILITY
                    VStack(alignment: .leading){
                        Text("Governing Law Clause")
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .padding(.bottom, 22)
                            .foregroundColor(.black)
                        Text("These terms and conditions shall be governed by and construed in accordance with the laws of the province of Quebec, and any applicable federal laws of Canada, without regard to conflict of law principles.")
                            .font(Font.custom("SF Pro", size: 17))
                            .lineSpacing(10)
                            .foregroundColor(.black)
                    }.frame(width: 361)
                        .padding(.bottom, 48)
                    
                    
                    Text("Contact Support:")
                    //                    .font(Font.custom("SF Pro", size: 17))
                        .lineSpacing(22)
                        .italic()
                        .foregroundColor(.black)
                    
                    Text("downtomeet.university@outlook.com")
                        .font(Font.custom("SF Pro", size: 17))
                        .lineSpacing(22)
                        .foregroundColor(.black)
                    
                }
            }
        }
    }
}

#Preview {
    TermsView()
}
