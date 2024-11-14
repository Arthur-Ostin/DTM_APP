//
//  CustomField.swift
//  DTM
//
//  Created by Code Whiz on 11/8/24.
//

import SwiftUI
import UIKit

struct CustomField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var returnKeyColor: UIColor
    var onSubmit: (() -> Void)?  // Closure to execute on return key press

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomField

        init(parent: CustomField) {
            self.parent = parent
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            parent.onSubmit?()  // Trigger the custom action
            return true
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text {
                parent.text = text
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }


    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.text = text
        textField.delegate = context.coordinator
        textField.returnKeyType = .done
        textField.tintColor = returnKeyColor
        textField.borderStyle = .none  // Remove default borders that may add extra padding
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textFieldDidChangeSelection(_:)), for: .editingChanged)
        return textField
    }


    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    
}


// MARK: Used for nationality on ONBOARD2
struct CustomTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var onCommit: () -> Void
        
        init(text: Binding<String>, onCommit: @escaping () -> Void) {
            _text = text
            self.onCommit = onCommit
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            onCommit()
            return true
        }
    }
    
    @Binding var text: String
    var onCommit: () -> Void
    var padding: UIEdgeInsets
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, onCommit: onCommit)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChangeSelection(_:)), for: .editingChanged)
        
        // Design
        textField.placeholder = ""
        
        //        textField.translatesAutoresizingMaskIntoConstraints = false
        //        textField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        return textField
    }
    
    
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    static func dismantleUIView(_ uiView: UITextField, coordinator: Coordinator) {
        // Remove constraints to avoid any conflict if needed
        uiView.removeConstraints(uiView.constraints)
    }
}



#Preview{
    Onboard1()
}
