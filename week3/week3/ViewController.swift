//
//  ViewController.swift
//  week3
//
//  Created by Phil on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextFIeld: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SecondViewController") as?
                SecondViewController else { return}

        
        guard let firstNumber = firstTextFIeld.text else {return}
        guard let secondNumber = secondTextField.text else {return}
        
        
        var result = 0;
        switch (sender as AnyObject).tag {
        case 1 :
             result = Int(firstNumber)! + Int(secondNumber)!
        case 2 :
             result = Int(firstNumber)! - Int(secondNumber)!
        case 3 :
            result = Int(firstNumber)! * Int(secondNumber)!
        case 4 :
            result = Int(firstNumber)! / Int(secondNumber)!
        default :
            return
        }
        nextViewController.resultString = String(result)
        nextViewController.view.alpha = 0.5
        //nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }

}

