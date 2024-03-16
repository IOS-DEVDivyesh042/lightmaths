//
//  IGE.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class IGE : UIViewController {
    @IBOutlet weak var igeTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["µg/dL", "mg/dL", "g/L", "µmol/L", "nmol/L"]

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let igeText = igeTextField.text, let ige = Double(igeText) {
            let selectedIndex = unitSegmentedControl.selectedSegmentIndex
            let selectedUnit = units[selectedIndex]
            var result: Double = 0.0

            switch selectedUnit {
            case "µg/dL":
                result = ige
            case "mg/dL":
                result = ige * 0.001
            case "g/L":
                result = ige * 0.00001
            case "µmol/L":
                result = ige * 1000.0
            case "nmol/L":
                result = ige * 1000000.0
            default:
                break
            }

            resultLabel.text = "Immunoglobulin E: \(ige) \(selectedUnit) is equal to \(result) \(selectedUnit)"
        } else {
            resultLabel.text = "Invalid input. Please enter a valid value."
        }
    }
}
