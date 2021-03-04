//
//  ViewController.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/02/24.
//

import UIKit

let models: [UpbitTickerModel] = [UpbitTickerModel]()

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "현재 시세"
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpBitTickerCell", for: indexPath)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
