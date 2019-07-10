//
//  ColorViewController.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/10.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    private let color: UIColor
    
    init(color: UIColor) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
    }
}
