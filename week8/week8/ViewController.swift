//
//  ViewController.swift
//  week8
//
//  Created by Phil on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    
    @IBOutlet weak var orangeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var orangeViewTapGestureRecognizer: UITapGestureRecognizer!
    var flag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeViewTapGestureRecognizer.addTarget(self, action: #selector(orangeViewDidTap))
        
    }

    @objc func orangeViewDidTap() {
        if !flag {
            UIView.animate(withDuration: 3, animations: {
                self.orangeViewTopConstraint.constant = 50
                self.orangeViewHeightConstraint.constant = 500
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag = true
            }
            )
        }
        else {
            UIView.animate(withDuration: 3, animations: {
                self.orangeViewTopConstraint.constant = 199
                self.orangeViewHeightConstraint.constant = 128
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag = false
            },
                        
            )
        }

    }
}

