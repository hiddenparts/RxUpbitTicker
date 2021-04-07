//
//  ViewController.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/02/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var disposeBag = DisposeBag()
    var viewModel = UpbitTickerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "현재 시세"
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        bindTableView()
    }

    private func bindTableView() {
        // viewModel의 output의 데이터가 tableView로 흐름
        viewModel.output
            .drive(tableView.rx.items(cellIdentifier: UpbitTickerCell.identifier, cellType: UpbitTickerCell.self)) { index, ticker, cell in
//                cell.ticker = ticker
                cell.subject.onNext(ticker)
            }.disposed(by: disposeBag)
        
        // 210318. 다음숙제는 어떻게 해야지 안버벅댈까
        // 패인?
        // cell과 각 ticker를 연결해줘야하는데 그렇게 안함
        // reloadData에서 reloadRows만 되게 하고싶었는데
    }

}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        20
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: UpbitTickerCell.identifier, for: indexPath)
//        return cell
//    }
//}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
