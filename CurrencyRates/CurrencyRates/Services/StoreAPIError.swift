//
//  StoreAPIError.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 11.11.2021.
//

import Foundation

enum StoreAPIError: Error, LocalizedError {
    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case dataCorrupted
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .urlError(let error):
            return error.localizedDescription
        case .decodingError(let error):
            return error.localizedDescription
        case .responseError(let status):
            return "Bad response code: \(status)"
        case .dataCorrupted:
            return "Data not found"
        case .genericError:
            return "An unknown error has been occured"
        }
    }
}
