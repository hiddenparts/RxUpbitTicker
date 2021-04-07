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
    // model == input
    var input: PublishRelay<[UpbitTickerModel]>
    
    // output
    var output: Driver<[UpbitTickerModel]>
    
    var input1: PublishRelay<[Observable<UpbitTickerModel>]>
    
    init() {
        self.input = PublishRelay<[UpbitTickerModel]>()
        self.output = input.asDriver(onErrorJustReturn: [])
        
        self.input1 = PublishRelay()
        
        // 모델에 영향을 주는 코드는 뷰모델에서 관리
        WebSocketManager.shared.viewModel = self
    }
}
