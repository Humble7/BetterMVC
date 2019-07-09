//
//  UIViewController.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/9.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embedChild(_ childController: UIViewController, in containerView: UIView? = nil) {
        
        // childController已经是其他控制器的子控制器了
        // 将childController从其他控制器中移除
        if let oldParent = childController.parent, oldParent != self {
            childController.beginAppearanceTransition(false, animated: false)
            
            childController.willMove(toParent: nil)
            childController.removeFromParent()
            
            if childController.viewIfLoaded?.superview != nil {
                childController.viewIfLoaded?.removeFromSuperview()
            }
            
            childController.endAppearanceTransition()
        }
        
        var targetContainerView = containerView ?? view
        if targetContainerView?.isContainedWithin(view) == false {
            targetContainerView = view
        }
        
        if childController.parent != self {
            childController.beginAppearanceTransition(true, animated: false)
            
            addChild(childController)
            childController.didMove(toParent: self)
            
            targetContainerView?.embedSubview(childController.view)
            
            childController.endAppearanceTransition()
        } else {  // childController已经是当前控制器的子控制器
            targetContainerView?.embedSubview(childController.view)
        }
    }
    
    
}
