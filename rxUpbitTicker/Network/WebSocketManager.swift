//
//  WebSocketManager.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/02.
//

import Foundation
import Starscream
import RxSwift

let UPBIT_URL = "wss://api.upbit.com/websocket/v1"

class WebSocketManager {
    
    static let shared = WebSocketManager()
    
    var socket: WebSocket
    var isConnected: Bool = false
    
    var viewModel: UpbitTickerViewModel? {
        didSet {
            connect()
        }
    }
    
    private init() {
        var request = URLRequest(url: URL(string: UPBIT_URL)!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
    }
    
    deinit {
        if isConnected {
            socket.disconnect()
        }
        isConnected = false
    }
    
    func connect() {
        if !isConnected {
            socket.connect()
            print("web socket start")
        }
    }
    
    func write(message: String) {
        if let data = message.data(using: .utf8) {
            socket.write(data: data)
        }
    }
    
    func disconnect() {
        if isConnected {
            socket.disconnect()
        }
        isConnected = false
    }
}

extension WebSocketManager: WebSocketDelegate {
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
            
            TickerManager.shared.start()
            
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
            if let ticker = try? JSONDecoder().decode(UpbitTickerModel.self, from: data) {
//                print(ticker)
                
                TickerManager.shared.appendTicker(ticker: ticker)
                let tickers = TickerManager.shared.tickerDict.values.sorted { ($0?.accTradePrice24H ?? 0.0) > ($1?.accTradePrice24H ?? 0.0) }.compactMap { $0 }
                
                // viewModel의 input에 데이터 전달
                viewModel?.input.accept(tickers)
            }
            
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
//            handleError(error)
        }
    }
    
}
