//
//  APIService.swift
//  ios-dca-calculator
//
//  Created by Levi  on 17/03/22.
//

import Foundation
import Combine

struct APIService {
    
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    let keys = ["R84XAA1LBLFBSKR6", "U71D05XJQYITFQLO", "0LJGLANZ52HONJOR"]
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
    
    
    let url = URL(string: urlString)!
    
    return URLSession.shared.dataTaskPublisher(for: url)
        .map({ $0.data })
        .decode(type: SearchResults.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
