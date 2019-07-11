//
//  UIView.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/9.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 在当前视图中内嵌子视图
    /// - Parameter subview: 被嵌入的子视图
    func embedSubview(_ subview: UIView) {
        
        // 已经是当前视图的子视图，什么也不做，直接返回
        if subview.superview == self{
            return
        }
        
        if subview.superview != nil {
            subview.removeFromSuperview()
        }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.frame = bounds
        addSubview(subview)
        
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: subview.bottomAnchor)
            ])
    }
    
    /// 当前视图是否被包含在其他视图中
    /// - Parameter containerView: 容器视图
    func isContainedWithin(_ containerView: UIView) -> Bool {
        var current: UIView? = self
        while let proposedView = current {
            if proposedView == containerView {
                return true
            }
            
            current = proposedView.superview
        }
        
        return false
    }
    
    /// 移除当前视图中的所有子视图
    func removeAllSubviews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
