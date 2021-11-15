//
//  RatesResults.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 12.11.2021.
//

import Foundation

struct RatesResults: Decodable {
    let productState: Int
    let message: String
    let rid: String
    let ratesDate: String
    let messageTitle: String
    let code: String
    let downloadDate: String
    let currencies: [Currency]

    enum CodingKeys: String, CodingKey {
        case productState
        case message
        case rid
        case ratesDate
        case messageTitle
        case code
        case downloadDate
        case currencies = "rates"
    }

    init(dictionary : Dictionary<String,Any>){
        productState = dictionary["productState"] as? Int ?? 0
        message = dictionary["message"] as? String ?? ""
        rid = dictionary["rid"] as? String ?? ""
        ratesDate = dictionary["ratesDate"] as? String ?? ""
        messageTitle = dictionary["messageTitle"] as? String ?? ""
        code = dictionary["code"] as? String ?? ""
        downloadDate = dictionary["downloadDate"] as? String ?? ""
        
        guard
            let r = dictionary["rates"] as? [[String: AnyObject]]
        else {
            currencies = []
            return
        }
        
        let currencies: [Currency] = r.map{ rate in
            let cur = Currency(with: rate)
            return cur
        }
        self.currencies = currencies
    }

    
}
