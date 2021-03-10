//
//  UpbitTickerCell.swift
//  rxUpbitTicker
//
//  Created by parts.ss on 2021/03/04.
//

import UIKit

class UpbitTickerCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!          // 이름
    @IBOutlet weak var priceLabel: UILabel!         // 가격
    @IBOutlet weak var changeRateLabel: UILabel!    // 전일대비
    @IBOutlet weak var tradeLabel: UILabel!         // 거래량
    
    var ticker: UpbitTickerModel? {
        didSet {
            update()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        update()
    }

    private func update() {
        guard let ticker = ticker else { return }
        
        nameLabel.text = ticker.code
        priceLabel.text = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: NSNumber(value: ticker.tradePrice))!
        }()
        changeRateLabel.text = String.init(format: "%.2f%%", ticker.changeRate * 100)
        tradeLabel.text = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: NSNumber(value: Int(ticker.accTradePrice24H / 1_000_000)))! + "백만"
        }()
    }
    
    
}
