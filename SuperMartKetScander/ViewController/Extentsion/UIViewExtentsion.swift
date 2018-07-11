//
//  UILabelExtentsion.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }
    
    func setBorder(borderWidth: CGFloat = 1, color: UIColor = .black, opacity: Float = 1, radius: CGFloat) {
        layer.masksToBounds = false
        layer.borderWidth = borderWidth
        layer.cornerRadius = radius
        layer.opacity = opacity
        layer.borderColor = color.cgColor
    }
}
