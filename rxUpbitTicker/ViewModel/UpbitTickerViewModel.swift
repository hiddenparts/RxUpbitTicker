//
//  UpbitTickerViewModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/04.
//

import RxSwift
import RxCocoa

class UpbitTickerViewModel {

    // 210318. 뷰모델에 대한 정확한 역할 고민
    
    // input은 WebSocketManager로 부터 들어옴
    var input = PublishRelay<[UpbitTickerModel]>()
    
    // output
    var output: Driver<[UpbitTickerModel]>
    
    let disposeBag = DisposeBag()
    
    init() {
        self.output = input.asDriver(onErrorJustReturn: [])
    }
}
