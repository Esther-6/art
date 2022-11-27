//
//  ContentView.swift
//  Art_demo
//
//  Created by xy的电脑 on 2022/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabView : View {
    @State var index = 0
    @Environment(\.colorScheme) var scheme
    var body: some View{
        VStack(spacing: 0){
            ZStack{
                HomeViem()
                    .opacity(self.index == 0 ? 1 : 0)
                CollectViem()
                    .opacity(self.index == 1 ? 1 : 0)
            }
            
            HStack{
                Button(action:{
                    self.index = 0
                }){
                    HStack(spacing: 15){
                        Image("house")
                            .foregroundColor(self.index == 0 ? .white : .primary)
                        if self.index == 0 {
                            Text("首页")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(self.index == 0 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
                
                Button(action:{
                    self.index = 1
                }){
                    HStack(spacing: 15){
                        Image("heart")
                            .foregroundColor(self.index == 1 ? .white : .primary)
                        if self.index == 1 {
                            Text("收藏")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(self.index == 1 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
                
                Button(action:{
                    self.index = 2
                }){
                    HStack(spacing: 15){
                        Image("person")
                            .foregroundColor(self.index == 2 ? .white : .primary)
                        if self.index == 2 {
                            Text("我的")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(self.index == 2 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                
            }
            .padding(.horizontal, 25)
            .padding(.top)
            .background(self.scheme == .dark ? Color.black : Color.white)
            .shadow(color: Color.primary.opacity(0.08),radius: 5,x: 0,y:-5)
            .padding(.bottom)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeViem : View {
    var body : some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                //轮播图
                PageView(datas.map { Card(landmark: $0) })
                
                //button
                HStack{
                    Button("中国画"){
                        
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button("书法"){
                        
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button("陶瓷"){
                        
                    }
                    .buttonStyle(.plain)
                }
                .padding()
                .padding(.horizontal,25)
                
                //列表
                ForEach(arts,id: \.self){art in
                    HStack(spacing: 15){
                        ForEach(art){i in
                            VStack{
                                Image(i.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 130)
                                    .clipped()
                                Text(i.title)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .background(Color.primary.opacity(0.06))
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct CollectViem : View {
    @State var search = ""
    var body : some View {
        VStack{
            HStack{
                Button("中国画"){
                    
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button("书法"){
                    
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button("陶瓷"){
                    
                }
                .buttonStyle(.plain)
            }
            .padding()
            .padding(.horizontal,55)
            
            HStack(spacing: 0){
                TextField("Search", text: self.$search)
                if self.search != ""{
                    Button(action: {
                        
                    }){
                        Image("magnifyingglass")
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal,35)
            .background(Color.primary.opacity(0.06))
            .cornerRadius(12)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    //列表
                    ForEach(arts,id: \.self){art in
                        HStack(spacing: 15){
                            ForEach(art){i in
                                VStack{
                                    Image(i.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 130)
                                        .clipped()
                                    Text(i.title)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .background(Color.primary.opacity(0.06))
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
