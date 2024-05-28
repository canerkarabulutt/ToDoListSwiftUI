//
//  AuthButton.swift
//  ToDoList
//
//  Created by Caner Karabulut on 28.05.2024.
//

import SwiftUI

struct AuthButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    AuthButton(title: "Title", background: .green) {
        
    }
}
