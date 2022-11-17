//
//  ViewController.swift
//  week6
//
//  Created by Phil on 2022/10/31.
//

import UIKit

class ViewController: UIViewController{


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clock: UILabel! // 카운트 다운

    var dataArray: [String] = []// 알람시간 저장 배열
    var timer = 0
    var tog = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataArray = UserDefaults.standard.array(forKey: "data") as? [String] ?? [] //
        threadTest()
        print("Start")
        print(UserDefaults.standard.array(forKey: "data") ?? [])
        self.tableView.dataSource = self

    }

    
    @IBAction func recordClicked(_ sender: Any) {
        dataArray.append(String(timer))
        print("saved data")
        print(timer)
        print(dataArray)
        UserDefaults.standard.set(dataArray,forKey: "data")
        self.tableView.reloadData()
    }
    @IBAction func buttonDidClicked(_ sender: Any) {
        tog.toggle()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        dataArray = []
        self.tableView.reloadData()
    }
    
    func threadTest() {
        print(UserDefaults.standard.array(forKey: "data") ?? [])
        DispatchQueue.global().async {
                for _ in 0...1000 {
                    DispatchQueue.main.async {
                        if self.tog {
                            self.timer += 1
                            self.clock.text = String(self.timer) // clock UI
                            print(self.clock.text!)
                        }
                    }
                    sleep(1)
                    
                }
        }
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = dataArray[indexPath.row]
            return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }

}

