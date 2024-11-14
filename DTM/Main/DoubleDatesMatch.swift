//
//  DoubleDatesMatch.swift
//  DTM
//
//  Created by 水野裕介 on 2024/09/10.
//

import SwiftUI

struct DoubleDatesMatch: View {
    @State var tmp = false
    @State var tmp2 = ["",""]
    var body: some View {
        VStack(spacing: 0) {
            Text("実験中")
            Button {
                
            } label: {
                Text("Push")
            }
            if tmp {
                Text("exist")
            } else {
                Text("not")
            }
            Button {
                // doubleDelete(name: "john.takahashi")
                Task {
                    do {
                        try await doubleState(name1: "yusuke.mizuno", name2: "nao.miura")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("add state")
            }
        }
        .task {
            Task {
                do {
                    try await getDouble(doubleData: $tmp2)
                    print("!!!!!!!!!!!!!!")
                    try await createInvite(to: "john.takahashi", from: "sigeru.sasaki", eventKey: "1")
                    print("!!!!!!!!!!!!!!")
                } catch {
                    print("Failed to fetch data: \(error)")
                }
            }
        }
    }
    
}

#Preview {
    DoubleDatesMatch()
}
