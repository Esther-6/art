//
//  PageController.swift
//  Art_demo
//
//  Created by xy的电脑 on 2022/11/27.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    
    // 轮播控制器当前页
    @Binding var currentPage: Int
    
    var controllers: [UIViewController]
    
    // 创建协调器
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // 创建controller
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        // 协调器遵守协议
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    // 更新controller
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
        }
        
        // MARK: - UIPageViewControllerDataSource
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            // 如果是第一个，返回最后一个
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1];
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            // 如果是最后一个，返回第一个
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1];
        }
        
        // MARK: - UIPageViewControllerDelegate
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if
                completed,
                let viewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: viewController) {
                parent.currentPage = index
            }
        }
    }
}
