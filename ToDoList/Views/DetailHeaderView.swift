//
//  DetailHeaderView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 3.06.2024.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [background.opacity(0.3), background.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(Angle(degrees: -angle))
            RoundedRectangle(cornerRadius: 24)
                .fill(background.opacity(1))
                .frame(width: UIScreen.main.bounds.width/1.1, height: (UIScreen.main.bounds.width)/2.25)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .frame(alignment: .center)
                .padding(.top, 40)
            VStack {
                Image(uiImage: .checkmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                Text(title)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: UIScreen.main.bounds.width*2, height: UIScreen.main.bounds.width)
        Spacer()
    }
}

#Preview {
    DetailHeaderView(title: "Title", subtitle: "Subtitle", angle: 0, background: .green)
}
