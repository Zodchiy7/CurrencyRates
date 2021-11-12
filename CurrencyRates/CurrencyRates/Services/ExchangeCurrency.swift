//
//  ExchangeCurrency.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 11.11.2021.
//

import Foundation

struct ExchangeCurrency {
    
    private let baseAPI_URL = "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44"
 
    private func generateRequest() -> URLRequest? {
        guard let url = URL(string: baseAPI_URL) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.addValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        let bodyJSON: [String: Any] = [
            "uid": "563B4852-6D4B-49D6-A86E-B273DD520FD2",
            "type": "ExchangeRates",
            "rid": "BEYkZbmV"
        ]
        let body = try? JSONSerialization.data(withJSONObject: bodyJSON)
        request.httpBody = body
        
        dump(request)
        return request
    }
    
    func currencyRates(completion: @escaping (Result<RatesResults, Swift.Error>) -> Void) {

        guard let request = generateRequest() else {
            completion(.failure(StoreAPIError.urlError(URLError(URLError.unsupportedURL))))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode else {
                completion(.failure(StoreAPIError.responseError(
                                        (response as? HTTPURLResponse)?.statusCode ?? 500)))
                return
            }
            
            do {
                guard
                    let resultsDictionary = try JSONSerialization.jsonObject(with: data!) as? [String: AnyObject]
                else {
                    completion(.failure(StoreAPIError.dataCorrupted))
                    return
                }
                dump(resultsDictionary)
                let ratesResults = RatesResults.init(dictionary: resultsDictionary)
                
                completion(.success(ratesResults))
            } catch {
                completion(.failure(error))
                return
            }
        }
        .resume()
    }


}
