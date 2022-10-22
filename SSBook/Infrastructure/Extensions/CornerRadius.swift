//
//  CornerRadius.swift
//  SSBook
//
//  Created by Diego Ferreira on 22/10/22.
//

import UIKit

extension UIView {
    
    func roundCornerView(corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        
        mask.path = path.cgPath
        
        layer.mask = mask
    }
}

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}


