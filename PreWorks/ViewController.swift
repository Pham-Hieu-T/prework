//
//  ViewController.swift
//  PreWorks
//
//  Created by Hieu Pham on 8/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        var tip = 0.0
        
        let  tipPercentages = [0.15, 0.18, 0.2]
        let choosen = tipControl.selectedSegmentIndex
        if choosen < 3{
            tip = Double(bill*tipPercentages[choosen])
            let total = bill + tip
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }else{
            let alertController = UIAlertController(title: "Custom Tip", message: "Amount of money", preferredStyle: .alert)

            alertController.addTextField { (textField) in
                // configure the properties of the text field
                textField.placeholder = "$$$$"
            }
            // add the buttons/actions to the view controller
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            tip = Double(alertController.textFields![0].text!)!
            let total = bill + tip
                self.tipAmountLabel.text = String(format: "$%.2f", tip)
                self.totalLabel.text = String(format: "$%.2f", total)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(saveAction)

            present(alertController, animated: true, completion: nil)
        }
        
        
        
    }
    
    
}

