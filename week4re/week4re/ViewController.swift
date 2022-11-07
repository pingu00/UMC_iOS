//
//  ViewController.swift
//  week4re
//
//  Created by Phil on 2022/11/02.
//

import UIKit
import Lottie
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView_custom: UITableView!
    let cellName: String = "customCell"
    var cellTitle: Array<String> = ["folder","pencil","eraser","doc","bolt","trash","pencil.circle","doc.text","tray","folder","pencil","eraser","doc","bolt","trash","pencil.circle","doc.text","tray","folder","pencil","eraser","doc","bolt","trash","pencil.circle","doc.text","tray","folder","pencil","eraser","doc","bolt","trash","pencil.circle","doc.text","tray"]
    
    let refreshControl = UIRefreshControl()
    
    //    lazy var activityIndicator: UIActivityIndicatorView = {
    //           // 해당 클로저에서 나중에 indicator 를 반환해주기 위해 상수형태로 선언
    //           let activityIndicator = UIActivityIndicatorView()
    //
    //           activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    //
    //           activityIndicator.center = self.view.center
    //
    //           // 기타 옵션
    //           activityIndicator.color = .purple
    //           activityIndicator.hidesWhenStopped = true
    //           activityIndicator.style = .medium
    //
    //           // stopAnimating을 걸어주는 이유는, 최초에 해당 indicator가 선언되었을 때, 멈춘 상태로 있기 위해서
    //           activityIndicator.stopAnimating()
    //
    //           return activityIndicator
    //
    //       }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView_custom.delegate = self
        tableView_custom.dataSource = self
        initRefreshControl()
//        cellTitle = cellTitle.randomElement()
    }
    
    lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView (name: "refreshLottie")
        animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let center = UIScreen.main.bounds.width / 2
        animationView.center = CGPoint(x: center, y: 40)
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    func initRefreshControl() {
        tableView_custom.refreshControl = refreshControl
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear
        refreshControl.addTarget(
            self,
            action: #selector (refreshTableView(refreshControl:)),
            for: .valueChanged
        )
    }
    @objc func refreshTableView(refreshControl: UIRefreshControl) {
        print("새로고침!!")

        lottieView.isHidden = false
        lottieView.play()
        DispatchQueue.main.asyncAfter (deadline: .now() + 2.0) {
            self.tableView_custom.reloadData()
            self.lottieView .isHidden = true
            self.lottieView.stop()
            refreshControl.endRefreshing()
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView_custom.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        let rCellTitle = cellTitle.shuffled()
        
        customCell.imageView_custom.image = UIImage(systemName: rCellTitle[indexPath.row])
        customCell.label_custom.text = rCellTitle[indexPath.row]
        if indexPath.row == 0 {
            customCell.label_custom.font = .boldSystemFont(ofSize: 20)
        }
        return customCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
}

