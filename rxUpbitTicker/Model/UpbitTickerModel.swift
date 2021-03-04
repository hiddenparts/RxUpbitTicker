//
//  UpbitTickerModel.swift
//  rxUpbitTicker
//
//  Created by parts.ss on 2021/03/04.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ticker = try? newJSONDecoder().decode(Ticker.self, from: jsonData)

import Foundation

// MARK: - UpbitTickerModel
struct UpbitTickerModel: Codable {
    let type, code: String
    let openingPrice, highPrice, lowPrice, tradePrice: Int
    let prevClosingPrice: Int
    let accTradePrice: Double
    let change: String
    let changePrice, signedChangePrice: Int
    let changeRate, signedChangeRate: Double
    let askBid: String
    let tradeVolume, accTradeVolume: Double
    let tradeDate, tradeTime: String
    let tradeTimestamp: Int
    let accAskVolume, accBidVolume: Double
    let highest52_WeekPrice: Int
    let highest52_WeekDate: String
    let lowest52_WeekPrice: Int
    let lowest52_WeekDate: String
    let tradeStatus: String?
    let marketState: String
    let marketStateForIos: String?
    let isTradingSuspended: Bool
    let delistingDate: String?
    let marketWarning: String
    let timestamp: Int
    let accTradePrice24H, accTradeVolume24H: Double
    let streamType: String

    enum CodingKeys: String, CodingKey {
        case type, code
        case openingPrice = "opening_price"
        case highPrice = "high_price"
        case lowPrice = "low_price"
        case tradePrice = "trade_price"
        case prevClosingPrice = "prev_closing_price"
        case accTradePrice = "acc_trade_price"
        case change
        case changePrice = "change_price"
        case signedChangePrice = "signed_change_price"
        case changeRate = "change_rate"
        case signedChangeRate = "signed_change_rate"
        case askBid = "ask_bid"
        case tradeVolume = "trade_volume"
        case accTradeVolume = "acc_trade_volume"
        case tradeDate = "trade_date"
        case tradeTime = "trade_time"
        case tradeTimestamp = "trade_timestamp"
        case accAskVolume = "acc_ask_volume"
        case accBidVolume = "acc_bid_volume"
        case highest52_WeekPrice = "highest_52_week_price"
        case highest52_WeekDate = "highest_52_week_date"
        case lowest52_WeekPrice = "lowest_52_week_price"
        case lowest52_WeekDate = "lowest_52_week_date"
        case tradeStatus = "trade_status"
        case marketState = "market_state"
        case marketStateForIos = "market_state_for_ios"
        case isTradingSuspended = "is_trading_suspended"
        case delistingDate = "delisting_date"
        case marketWarning = "market_warning"
        case timestamp
        case accTradePrice24H = "acc_trade_price_24h"
        case accTradeVolume24H = "acc_trade_volume_24h"
        case streamType = "stream_type"
    }
}
