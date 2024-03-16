//
//  TIBC.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class TIBC : UIViewController {
    @IBOutlet weak var ibcTotalTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["µg/dL", "mg/dL", "g/L", "µmol/L", "nmol/L"]

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let ibcTotalText = ibcTotalTextField.text, let ibcTotal = Double(ibcTotalText) {
            let selectedIndex = unitSegmentedControl.selectedSegmentIndex
            let selectedUnit = units[selectedIndex]
            var result: Double = 0.0

            switch selectedUnit {
            case "µg/dL":
                result = ibcTotal
            case "mg/dL":
                result = ibcTotal * 0.001
            case "g/L":
                result = ibcTotal * 0.00001
            case "µmol/L":
                result = ibcTotal * 1000.0
            case "nmol/L":
                result = ibcTotal * 1000000.0
            default:
                break
            }

            resultLabel.text = "Iron Binding Capacity Total: \(ibcTotal) \(selectedUnit) is equal to \(result) \(selectedUnit)"
        } else {
            resultLabel.text = "Invalid input. Please enter a valid value."
        }
    }
}
