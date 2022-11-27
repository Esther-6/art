//
//  PageView.swift
//  Art_demo
//
//  Created by xy的电脑 on 2022/11/27.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @State var currentPage: Int = 0
    
    var viewControllers: [UIHostingController<Page>]
    
    // 初始化方法，利用SwiftUI视图创建UIHostingController
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, controllers: viewControllers)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .frame(width:400,height: 300)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(datas.map { Card(landmark: $0) })
    }
}

