//
//  TickerManager.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/11.
//

import Foundation

class TickerManager {
    static let shared = TickerManager()
    
    var tickerDict:[String:UpbitTickerModel?] = [String:UpbitTickerModel?]()
    
    private init() {
        
    }
    
    func start() {
        APIManager.shared.getMarketAll { models in
            self.requestUpbitTicker(models: models.filter { $0.market.contains("KRW-") })
        }
    }
    
    func requestUpbitTicker(models: [UpbitMarketCodeModel]) {
        var requestModel = UpbitRequestModel()
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
}
