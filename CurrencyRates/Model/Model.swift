//
//  Model.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 11.11.2021.
//

import Foundation

final class Model {
  
    static let shared = Model()
    private init() { }
    
    var ratesResults: RatesResults?
    private let exchangeCurrency = ExchangeCurrency()

    func updateCurrenyRates(completion: @escaping (Result<Bool, Error>) -> Void) {
        exchangeCurrency.currencyRates { results in
            switch results {
            case .failure(let error) :
                print("Error reciving data: \(error)")
                completion(.failure(error))
            case .success(let ratesResults):
                print("Found \(ratesResults.currencies.count) currencies")
                self.ratesResults = ratesResults
                completion(.success(true))
            }
        }
    }
}
