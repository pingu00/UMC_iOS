//
//  ViewController.swift
//  week6
//
//  Created by Phil on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstNum: UILabel!
    @IBOutlet weak var secondNum: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        threadTest()
    }
    func threadTest() {
        DispatchQueue.global().async {
            for num in 0...10 {
                DispatchQueue.main.async {
                    self.firstNum.text = String(10-num)
                    if num == 10 {
                        self.firstNum.text = "done"
                        
                    }
                }
                
                sleep(2)
            }
        }
        DispatchQueue.global().async {
            for num in 0...15 {
                DispatchQueue.main.async {
                    self.secondNum.text = String(15-num)
                    if num == 15 {
                        self.firstNum.text = "done"
                        
                    }
                }
                
                sleep(1)
            }
        }
        
    }
}

