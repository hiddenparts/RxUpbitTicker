//
//  UpbitMarketCodeModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/05.
//

import Foundation

struct UpbitMarketCodeModel: Codable {
    let market: String
    let koreanName: String
    let englishName: String
    let marketWarning: String = "NONE"
 
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
        case marketWarning = "market_warning"
    }
}
