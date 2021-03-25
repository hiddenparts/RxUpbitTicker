//
//  UpbitRequestModel.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/11.
//

import Foundation

struct UpbitWebSocketRequestModel: Encodable {

    struct WSTickerFields: Encodable {
        let ticket = UUID()
    }

    struct WSTypeFields: Encodable {
        let type = "ticker"
        var codes: [String] = []
    }
    
    struct WSFormatFields: Encodable {
        let format = "DEFAULT"
    }
    
    var ticker = WSTickerFields()
    var typefields = WSTypeFields()
    var formatFields = WSFormatFields()
    
    mutating func addCode(code: String) {
        typefields.codes.append(code)
    }
    
    func toJSONString() -> String? {
        do {
            let tickerField = try JSONEncoder().encode(ticker)
            let tickerStr = String(data: tickerField, encoding: .utf8)!
            
            let typeField = try JSONEncoder().encode(typefields)
            let typeFieldStr = String(data: typeField, encoding: .utf8)!
            
            let formatField = try JSONEncoder().encode(formatFields)
            let formatFieldStr = String(data: formatField, encoding: .utf8)!
            
            return "[\(tickerStr), \(typeFieldStr), \(formatFieldStr)]"
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
