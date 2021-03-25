//
//  APIManager.swift
//  rxUpbitTicker
//
//  Created by parts.ss on 2021/03/04.
//

import Foundation

class APIManager {
    
    enum ServiceURL: String {
        case marketAll = "https://api.upbit.com/v1/market/all?isDetails=true"
        
        func getURL() -> URL {
            switch self {
            case .marketAll:
                return URL(string: self.rawValue)!
            }
        }
    }
    
    static let shared = APIManager()
    
    private init() {
    }
    
    private func request<T: Codable>(url: URL, completion: @escaping (T) -> ()) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    if let data = data {
                        let marketData = try JSONDecoder().decode(T.self, from: data)
                        completion(marketData)
                    } else {
                        print("error")
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getMarketAll(completion: @escaping ([UpbitMarketCodeModel]) -> ()) {
        request(url: ServiceURL.marketAll.getURL(), completion: completion)
    }
}
