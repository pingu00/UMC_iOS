//
//  SecondViewController.swift
//  week3
//
//  Created by Phil on 2022/10/06.
//

import UIKit

class SecondViewController: UIViewController {
    var resultString = ""
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultString 
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    

}
