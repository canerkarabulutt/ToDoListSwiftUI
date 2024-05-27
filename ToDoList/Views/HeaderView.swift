//
//  HeaderView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.4), Color.green.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: -30))
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.4), Color.green.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: 30))
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.green.opacity(1))
                .frame(width: UIScreen.main.bounds.width - 120, height: (UIScreen.main.bounds.width - 40)/2 )
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .frame(alignment: .center)
            VStack {
                Image(uiImage: .checkmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .padding(.bottom, 10)
                Text("To Do List")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 4)
                Text("Manage your task easily!")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .bold()
                    .italic()
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black.opacity(0.6), radius: 2, x: 0, y: 2)
            }
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 320)
        .offset(y: -40)
    }
}

#Preview {
    HeaderView()
}

