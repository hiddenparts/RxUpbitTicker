//
//  UpbitTickerViewModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/04.
//

import RxSwift
import RxCocoa

class UpbitTickerViewModel {

    var input = PublishRelay<[UpbitTickerModel]>()
    
    // output
    var tickers: Driver<[UpbitTickerModel]>
    
    private var _tickers = PublishRelay<[UpbitTickerModel]>()
    
    let disposeBag = DisposeBag()
    
    init() {
        self.tickers = _tickers.asDriver(onErrorJustReturn: [])
        
        // input으로 들어온 TickerModel은 내부의 _tickers에게 전달
        // input은 WebSocketManager로 부터 들어옴
        self.input
            .bind(to: _tickers)
            .disposed(by: disposeBag)
    }
}
