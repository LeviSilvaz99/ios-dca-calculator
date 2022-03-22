//
//  SearchTableViewCell.swift
//  ios-dca-calculator
//
//  Created by Levi  on 17/03/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var assetTypeLabel: UILabel!
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetSymbolLabel.text = searchResult.type
        assetTypeLabel.text = searchResult.type
            .appending(" ")
            .appending(searchResult.currency)
    }
    
}
