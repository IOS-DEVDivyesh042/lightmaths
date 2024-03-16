//
//  IGG.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class IGG : UIViewController {
    @IBOutlet weak var iggTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["µg/dL", "mg/dL", "g/L", "µmol/L", "nmol/L"]

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        if let iggText = iggTextField.text, let igg = Double(iggText) {
            let selectedIndex = unitSegmentedControl.selectedSegmentIndex
            let selectedUnit = units[selectedIndex]
            var result: Double = 0.0

            switch selectedUnit {
            case "µg/dL":
                result = igg
            case "mg/dL":
                result = igg * 0.001
            case "g/L":
                result = igg * 0.00001
            case "µmol/L":
                result = igg * 1000.0
            case "nmol/L":
                result = igg * 1000000.0
            default:
                break
            }

            resultLabel.text = "Immunoglobulin G: \(igg) \(selectedUnit) is equal to \(result) \(selectedUnit)"
        } else {
            resultLabel.text = "Invalid input. Please enter a valid value."
        }
    }
}


