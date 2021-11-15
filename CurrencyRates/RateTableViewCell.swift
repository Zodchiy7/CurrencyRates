//
//  RateTableViewCell.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 12.11.2021.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var currMmemFromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var currMmemToLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var deltaSellLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var deltaBuyLabel: UILabel!
    @IBOutlet weak var tpLabel: UILabel!
    @IBOutlet weak var basicLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(from currency: Currency) {
        nameLabel.text = currency.name
        fromLabel.text = currency.from.description
        currMmemFromLabel.text = currency.currMnemFrom
        toLabel.text = currency.to.description
        currMmemToLabel.text = currency.currMnemTo
        saleLabel.text = currency.sale
        deltaSellLabel.text = currency.deltaSale
        buyLabel.text = currency.buy
        deltaBuyLabel.text = currency.deltaBuy
        tpLabel.text = currency.tp.description
        basicLabel.text = currency.basic
    }


}
