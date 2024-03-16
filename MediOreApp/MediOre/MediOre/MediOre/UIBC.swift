//
//  UIBC.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class UIBC : UIViewController {
    @IBOutlet weak var ibcUnsaturatedTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["µg/dL", "mg/dL", "g/L", "µmol/L", "nmol/L"]

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let ibcUnsaturatedText = ibcUnsaturatedTextField.text, let ibcUnsaturated = Double(ibcUnsaturatedText) {
            let selectedIndex = unitSegmentedControl.selectedSegmentIndex
            let selectedUnit = units[selectedIndex]
            var result: Double = 0.0

            switch selectedUnit {
            case "µg/dL":
                result = ibcUnsaturated
            case "mg/dL":
                result = ibcUnsaturated * 0.001
            case "g/L":
                result = ibcUnsaturated * 0.00001
            case "µmol/L":
                result = ibcUnsaturated * 1000.0
            case "nmol/L":
                result = ibcUnsaturated * 1000000.0
            default:
                break
            }

            resultLabel.text = "Iron Binding Capacity Unsaturated: \(ibcUnsaturated) \(selectedUnit) is equal to \(result) \(selectedUnit)"
        } else {
            resultLabel.text = "Invalid input. Please enter a valid value."
        }
    }
}

