//
//  UpbitRequestModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/11.
//

import Foundation

struct UpbitRequestModel: Encodable {

    struct UpbitTicker: Encodable {
        let ticket = UUID()
    }

    struct UpbitTypeCodes: Encodable {
        let type = "ticker"
        var codes: [String] = []
    }
    
    var ticker = UpbitTicker()
    var typeCodes = UpbitTypeCodes()

    mutating func addCode(code: String) {
        typeCodes.codes.append(code)
    }

    func toJSONString() -> String? {
        do {
            let tickerData = try JSONEncoder().encode(ticker)
            let trickerStr = String(data: tickerData, encoding: .utf8)!
            let typeCodesData = try JSONEncoder().encode(typeCodes)
            let typeCodesStr = String(data: typeCodesData, encoding: .utf8)!
            return "[\(trickerStr), \(typeCodesStr)]"
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
