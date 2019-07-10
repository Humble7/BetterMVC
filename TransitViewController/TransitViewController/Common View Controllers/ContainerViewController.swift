//
//  ContainerViewController.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/10.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    var content: UIViewController? {
        didSet {
            replaceChild(oldValue, with: content)
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    init(content: UIViewController?) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(content: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replaceChild(nil, with: content)
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return content
    }
    
    private func replaceChild(_ oldChild: UIViewController?,
                              with newChild: UIViewController?) {
        let duration: TimeInterval
        let options: UIView.AnimationOptions
        
        if viewIfLoaded?.window == nil {
            duration = 0
            options = []
        } else {
            duration = 0.3
            options = .transitionCrossDissolve
        }
        
        switch (oldChild, newChild) {
            case (let o?, let n?):
                transition(from: o, to: n, in: view, duration: duration, options: options)
            case (let o?, nil):
                transition(from: o, in: view, duration: duration, options: options)
            case (nil, let n?):
                transition(to: n, in: view, duration: duration, options: options)
            case (nil, nil):
                return
        }
    }
    
    // 两个控制器之间转场
    private func transition(from: UIViewController,
                            to: UIViewController,
                            in container: UIView,
                            duration: TimeInterval,
                            options: UIView.AnimationOptions) {
        if from == to {
            return
        }
        
        from.beginAppearanceTransition(false, animated: true)
        to.beginAppearanceTransition(true, animated: true)
        
        from.willMove(toParent: nil)
        addChild(to)
        
        to.view.alpha = 0
        from.view.alpha = 1
        
        container.embedSubview(to.view)
        container.bringSubviewToFront(from.view)
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            to.view.alpha = 1
            from.view.alpha = 0
        }) { _ in
            from.view.removeFromSuperview()
            from.endAppearanceTransition()
            to.endAppearanceTransition()
            
            from.removeFromParent()
            to.didMove(toParent: self)
        }
    }
    
    // 将控制器新添加到容器控制器
    private func transition(to: UIViewController, in container: UIView, duration: TimeInterval, options: UIView.AnimationOptions) {
        to.beginAppearanceTransition(true, animated: true)
        
        addChild(to)
        
        to.view.alpha = 0

        container.embedSubview(to.view)
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            to.view.alpha = 1
        }) { _ in
            to.didMove(toParent: self)
            
            to.endAppearanceTransition()
        }
    }
    
    // 从容器控制器中移除子控制器
    private func transition(from: UIViewController, in container: UIView, duration: TimeInterval, options: UIView.AnimationOptions) {
        from.beginAppearanceTransition(false, animated: true)
        
        from.willMove(toParent: nil)
        
        from.view.alpha = 1
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            from.view.alpha = 0
        }) { _ in
            from.view.removeFromSuperview()
            from.endAppearanceTransition()
            
            from.removeFromParent()
        }
    }
}
