//
//  HeaderView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [background.opacity(0.4), background.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: -angle))
            LinearGradient(gradient: Gradient(colors: [background.opacity(0.4), background.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: angle))
            RoundedRectangle(cornerRadius: 24)
                .fill(background.opacity(1))
                .frame(width: UIScreen.main.bounds.width/1.5, height: (UIScreen.main.bounds.width)/2.25 )
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .frame(alignment: .center)
                .offset(y: -4)
            VStack {
                Image(uiImage: .checkmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .padding(.bottom, 10)
                Text(title)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 4)
                Text(subtitle)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .bold()
                    .italic()
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black.opacity(0.6), radius: 2, x: 0, y: 2)
            }
        }
        .frame(width: UIScreen.main.bounds.width*2, height: UIScreen.main.bounds.width/1.5)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 30, background: .green)
}
