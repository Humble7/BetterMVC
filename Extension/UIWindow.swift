//
//  UIWindow.swift
//  ToDoList
//
//  Created by 陈振 on 2019/7/11.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

extension UIWindow {
    
    convenience init(rootViewController: UIViewController) {
        self.init(frame: UIScreen.main.bounds)
        self.rootViewController = rootViewController
        self.makeKeyAndVisible()
    }
    
}
