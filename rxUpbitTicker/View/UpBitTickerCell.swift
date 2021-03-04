//
//  UpBitTickerCell.swift
//  rxUpbitTicker
//
//  Created by parts.ss on 2021/03/04.
//

import UIKit

class UpBitTickerCell: UITableViewCell {

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

    func update() {
        guard let ticker = ticker else { return }
        
        nameLabel.text = ticker.code
        priceLabel.text = "\(ticker.tradePrice)"
        changeRateLabel.text = "\(ticker.changeRate)"
        tradeLabel.text = "\(ticker.tradeVolume)"
    }
}
