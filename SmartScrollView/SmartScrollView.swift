//
//  SmartScrollView.swift
//  SmartScrollView
//
//  Created by Samba Diawara on 2022-06-25.
//

import SwiftUI
import UIKit


struct SmartScrollView<Content: View>: UIViewRepresentable {
    
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.bounces = true
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        let hostingController: UIHostingController = UIHostingController(rootView: self.content())
        scrollView.addSubview(hostingController.view)
        self.pinEdges(of: hostingController.view, to: scrollView)
    }
    
    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }
    
    class Coordinator:NSObject, UIScrollViewDelegate {
        
        let control : SmartScrollView
        init(_ control: SmartScrollView) {
            self.control = control
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("scroll")
        }
        
        func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            print("end scroll")
        }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            print("end")
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("end decelate")
        }
    }
    
    
    

}
