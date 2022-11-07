//
//  ViewController.swift
//  week1
//
//  Created by Phil on 2022/09/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var MyWorkTableView: UITableView!
    
    let cellidentifier = "MyWork"
    let cellData = ["Issue","Pull Request","Discussion","Repositories","Organizations","Starred"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyWorkTableView.delegate = self
        MyWorkTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        cell.textLabel?.text = cellData[indexPath.row]
                return cell
    }
    

}

