//
//  Model.swift
//  Art_demo
//
//  Created by xy的电脑 on 2022/11/27.
//

import Foundation
import SwiftUI

struct Landmark: Identifiable {
    var id = UUID()
    var name: String
    var park: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}


let datas = [
    Landmark(name: "Turtle Rock", park: "Joshua Tree National Park", imageName: "turtlerock_feature"),
    Landmark(name: "St.Mary Lake", park: "Glacier National Park", imageName: "stmarylake_feature"),
    Landmark(name: "Charley Rivers", park: "Charley Rivers National Preserve", imageName: "charleyrivers_feature")
]

struct Art: Identifiable,Hashable {
    var id : Int
    var image: String
    var title: String
}

var arts = [
    [
        Art(id: 0,image: "house",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "heart",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "house",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "house",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "house",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "house",title: "1"),
        Art(id: 1,image: "house",title: "2")
    ],
    [
        Art(id: 0,image: "house",title: "1"),
    ],
]
