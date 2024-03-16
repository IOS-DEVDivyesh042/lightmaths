//
//  IGM.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class IGM : UIViewController {
    @IBOutlet weak var igmTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["µg/dL", "mg/dL", "g/L", "µmol/L", "nmol/L"]

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let igmText = igmTextField.text, let igm = Double(igmText) {
            let selectedIndex = unitSegmentedControl.selectedSegmentIndex
            let selectedUnit = units[selectedIndex]
            var result: Double = 0.0

            switch selectedUnit {
            case "µg/dL":
                result = igm
            case "mg/dL":
                result = igm * 0.001
            case "g/L":
                result = igm * 0.00001
            case "µmol/L":
                result = igm * 1000.0
            case "nmol/L":
                result = igm * 1000000.0
            default:
                break
            }

            resultLabel.text = "Immunoglobulin M: \(igm) \(selectedUnit) is equal to \(result) \(selectedUnit)"
        } else {
            resultLabel.text = "Invalid input. Please enter a valid value."
        }
    }
}
