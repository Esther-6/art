//
//  Card.swift
//  Art_demo
//
//  Created by xy的电脑 on 2022/11/27.
//

import SwiftUI

struct Card: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.image
            .resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .overlay(TextOverlay(landmark: landmark))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(landmark: datas[0])
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                Text(landmark.park)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

