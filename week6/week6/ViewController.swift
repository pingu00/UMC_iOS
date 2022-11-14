//
//  ViewController.swift
//  week6
//
//  Created by Phil on 2022/10/31.
//

import UIKit

class ViewController: UIViewController{


    @IBOutlet weak var clock: UILabel! // 카운트 다운
    @IBOutlet weak var alram: UITextField! // 입력한 시간
    var dataArray: [String] = []// 알람시간 저장 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataArray = (UserDefaults.standard.array(forKey: "data") as? [String]) ?? [] // 배열에다가 DB에 저장된 스트링 배열을 임시 저장 배열로 옮김.
        threadTest()
        print("Start")
        print(UserDefaults.standard.array(forKey: "data") ?? nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(dataArray,forKey: "data") // 앱이 꺼진후에 배열에 저장된 시간 정보를 DB에 저장한다.
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        threadTest()
    }
    @IBAction func buttonDidClicked(_ sender: Any) {
        let text = alram.text! // textfield 의 내용을 text에 담는다
        dataArray.append(text) // 내용을 dataArray에 추가한다.
        print("saved data")
        print(text)
        print(dataArray)
    }
    
    
    func threadTest() {
        print(UserDefaults.standard.array(forKey: "data") ?? nil)
        DispatchQueue.global().async {
            for num in 0...20 {
                DispatchQueue.main.async {
                    self.clock.text = String(20-num) // clock UI 카운트다운
                    print(self.clock.text!)
                    if num == 20 { // 0이 되었을떄 done
                        self.clock.text = "done"
                    }
                    if (self.dataArray.contains(self.clock.text!)) {
                        print("알람") // dataArray 에 저장된 시간이 clock 의 숫자를 포함한다면 "알람" 출력
                    }
                }

                sleep(2)
            }
        }
        
    }
}

