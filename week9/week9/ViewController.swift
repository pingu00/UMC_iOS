//
//  ViewController.swift
//  week9
//
//  Created by Phil on 2022/11/24.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    override func viewDidLoad() {
         if let url = URL(string:"https://api.odcloud.kr/api/apnmOrg/v1/list?page=1&perPage=10&serviceKey=ZQt/Ni3dyygrfcdjgIbl/VeBfpacn86xVEmZBvnUVtilQ3yhUUsV/XKCXWon8k3LUWNebpHWjHCxFrVutV6QWg==") {
             let request = URLRequest.init(url: url)
             
             URLSession.shared.dataTask(with: request) {
                 (data, response, error) in guard let data = data else {return}
                 let decoder = JSONDecoder()
                 print(response as Any)
                 do{ let json = try decoder.decode(hospitalData.self , from: data)
                      print(json)
                 }
                 catch{
                     print(error)
                 }
             }.resume()
         }
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
                   UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                       if let error = error {
                           print(error)
                       }
                       else {
                           print("loginWithKakaoTalk() success.")

                           //do something
                           _ = oauthToken
                       }
                   }
               }
    }
    

 }





