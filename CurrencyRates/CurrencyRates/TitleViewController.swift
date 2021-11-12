//
//  TitleViewController.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 12.11.2021.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var productStateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratesDateLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var ridLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productStateLabel.text = ""
        messageLabel.text = ""
        titleLabel.text = ""
        downloadLabel.text = ""
        ratesDateLabel.text = ""
        codeLabel.text = ""
        ridLabel.text = ""
    }
    
    func updateLabel(ratesResults: RatesResults) {
        productStateLabel.text = String("\(ratesResults.productState)")
        messageLabel.text = ratesResults.message
        titleLabel.text = ratesResults.messageTitle
        downloadLabel.text = ratesResults.downloadDate
        ratesDateLabel.text = ratesResults.ratesDate
        codeLabel.text = ratesResults.code
        ridLabel.text = ratesResults.rid
    }
}
