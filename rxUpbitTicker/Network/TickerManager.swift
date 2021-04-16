//
//  TickerManager.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/11.
//

import Foundation
import RxSwift

class TickerManager {
    static let shared = TickerManager()
    var viewModel: UpbitTickerViewModel?
    
    var tickerDict:[String:UpbitTickerModel] = [String:UpbitTickerModel]()
    
    private init() {
        
    }
    
    func start() {
        APIManager.shared.getMarketAll { models in
            let krwSymbols = models.filter { $0.market.contains("KRW-") }
            for sym in krwSymbols {
                self.tickerDict[sym.market] = UpbitTickerModel()
            }
            self.viewModel?.setInput(markets: krwSymbols)
            self.requestUpbitTicker(models: krwSymbols)
        }
    }
    
    func requestUpbitTicker(models: [UpbitMarketCodeModel]) {
        var requestModel = UpbitWebSocketRequestModel()
        models.forEach { requestModel.addCode(code: $0.market) }
        
        if let message = requestModel.toJSONString() {
            WebSocketManager.shared.write(message: message)
        }
    }
    
    // TODO
    // 여러 티커들을 모아서 정렬시키고 할 수 있게..
    func appendTicker(ticker: UpbitTickerModel) {
        tickerDict[ticker.code] = ticker
    }
    
    func sortedTickerList() -> [UpbitTickerModel] {
//        return tickerDict.values.map { $0 }
        return tickerDict.values.sorted { $0.accTradePrice24H > $1.accTradePrice24H }.compactMap { $0 }
    }
}
