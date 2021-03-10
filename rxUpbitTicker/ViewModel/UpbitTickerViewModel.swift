//
//  UpbitTickerViewModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/04.
//

import RxSwift
import RxCocoa

class UpbitTickerViewModel {

    var datas = PublishSubject<[UpbitTickerModel]>()
    
    lazy var tickers: Driver<[UpbitTickerModel]> = {
        return datas.asDriver(onErrorJustReturn: [])
    }()
}
