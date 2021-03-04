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
    
    private init() {
        var request = URLRequest(url: URL(string: UPBIT_URL)!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
        print("web socket start")
    }
    
    deinit {
        if isConnected {
            socket.disconnect()
        }
        isConnected = false
    }
    
    func write(message: String) {
        if let data = message.data(using: .utf8) {
            socket.write(data: data)
        }
    }
    
    func close() {
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
            
            let message = "[{\"ticket\":\"\(UUID())\"},{\"type\":\"ticker\",\"codes\":[\"KRW-BTC\", \"KRW-ETH\"]}]"
            print("message : \(message)")
            self.write(message: message)
            
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
//            print("Received data: \(data.count)")
//            if let dataString = String(data: data, encoding: .utf8) {
//                print(dataString)
//            }
            let ticker = try? JSONDecoder().decode(UpbitTickerModel.self, from: data)
            print(ticker)
            // 여기서 발행해야할거같음
            
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
