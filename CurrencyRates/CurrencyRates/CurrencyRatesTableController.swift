//
//  CurrencyRatesTableController.swift
//  CurrencyRates
//
//  Created by Oleg Bondar on 11.11.2021.
//

import UIKit

class CurrencyRatesTableController: UITableViewController {

    let model = Model.shared
    @IBOutlet weak var prodStateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var ratesDateLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var ridLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTitle()
        updateCurrenyRates()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.ratesResults?.currencies.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? RateTableViewCell
        else {
            preconditionFailure("Invalid cell type")
        }

        // Configure the cell...
        guard let currency = model.ratesResults?.currencies[indexPath.row] else {
            preconditionFailure("Invalid currency")
        }
        cell.updateCell(from: currency)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}

extension CurrencyRatesTableController {
    
    func updateCurrenyRates() {
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.bounds
        activityIndicator.startAnimating()

        model.updateCurrenyRates{ [unowned self] results in
            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview()
                
                switch results {
                case .failure(let error) :
                    print("Error reciving data: \(error)")
                case .success(_):
                    self.tableView?.reloadData()
                    updateTitle()
                }
            }
        }
    }

    func updateTitle() {
        guard let res = self.model.ratesResults else {
            prodStateLabel.text = ""
            messageLabel.text = ""
            messageTitle.text = ""
            ratesDateLabel.text = ""
            downloadLabel.text = ""
            codeLabel.text = ""
            ridLabel.text = ""
            return
        }
        prodStateLabel.text = res.productState.description
        messageLabel.text = res.message
        messageTitle.text = res.messageTitle
        ratesDateLabel.text = res.ratesDate
        downloadLabel.text = res.downloadDate
        codeLabel.text = res.code
        ridLabel.text = res.rid
    }

}

