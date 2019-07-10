//
//  CoordinatorViewController.swift
//  TransitViewController
//
//  Created by 陈振 on 2019/7/10.
//  Copyright © 2019 陈振. All rights reserved.
//

import UIKit

class CoordinatorViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    private let colorContainerViewController = ContainerViewController()
    private let orangeColorViewController = ColorViewController(color: .orange)
    private let greenColorViewController = ColorViewController(color: .green)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedChild(colorContainerViewController, in: containerView)
    }
    
    @IBAction func orange(_ sender: UIButton) {
        if colorContainerViewController.content == orangeColorViewController {
            colorContainerViewController.content = nil
        } else {
            colorContainerViewController.content = orangeColorViewController
        }
    }
    
    @IBAction func Green(_ sender: UIButton) {
        if colorContainerViewController.content == greenColorViewController {
            colorContainerViewController.content = nil
        } else {
            colorContainerViewController.content = greenColorViewController
        }
    }
}
