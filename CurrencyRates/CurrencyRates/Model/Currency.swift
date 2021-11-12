//
//  Currency.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 11.11.2021.
//

import Foundation

struct Currency: Decodable {
    let from: Int
    let currMnemFrom: String
    let tp: Int
    let sale: String
    let buy: String
    let deltaSale: String
    let basic: String
    let deltaBuy: String
    let currMnemTo: String
    let to: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case from
        case currMnemFrom
        case tp
        case sale
        case buy
        case deltaSale
        case basic
        case deltaBuy
        case currMnemTo
        case to
        case name
    }
    
    init(with rate: [String: AnyObject]) {
        from = Int(rate["from"] as? Int64 ?? 0)
        currMnemFrom = rate["currMnemFrom"] as? String ?? ""
        tp = rate["tp"] as? Int ?? 0
        sale = rate["sale"] as? String ?? ""
        buy = rate["buy"] as? String ?? ""
        deltaSale = rate["deltaSale"] as? String ?? ""
        basic = rate["basic"] as? String ?? ""
        deltaBuy = rate["deltaBuy"] as? String ?? ""
        currMnemTo = rate["currMnemTo"] as? String ?? ""
        to = rate["to"] as? Int ?? 0
        name = rate["name"] as? String ?? ""
//        dump(self)
    }
}
