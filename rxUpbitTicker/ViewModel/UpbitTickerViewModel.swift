//
//  UpbitTickerViewModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/04.
//

import RxSwift
import RxCocoa

class UpbitTickerViewModel {

    // input은 WebSocketManager로 부터 들어옴
    // model == input
    var input: PublishRelay<[UpbitTickerModel]>
    
    // output
    var output: Driver<[UpbitTickerModel]>
    
    var input1: PublishRelay<[PublishSubject<UpbitTickerModel>]>
    var output1: Driver<[PublishSubject<UpbitTickerModel>]>
    
    init() {
        self.input = PublishRelay<[UpbitTickerModel]>()
        self.output = input.asDriver(onErrorJustReturn: [])
        
        self.input1 = PublishRelay()
        self.output1 = input1.asDriver(onErrorJustReturn: [])
        
        // 모델에 영향을 주는 코드는 뷰모델에서 관리
        WebSocketManager.shared.viewModel = self
    }
    
    var obDict: [String: PublishSubject<UpbitTickerModel>] = [:]
    
    func updateTicker(ticker: UpbitTickerModel) {
        if obDict[ticker.code] == nil {
            obDict[ticker.code] = PublishSubject<UpbitTickerModel>()
        }
        input1.accept(Array(obDict.values))
//        obDict[ticker]?.on(.next(model))
        
    }
}
