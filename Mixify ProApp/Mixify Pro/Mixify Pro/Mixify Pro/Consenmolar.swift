//
//  Consenmolar.swift
//  BlendifyPro
//
//  Created by Manish Bhanushali on 11/11/23.
//

import UIKit

class Consenmolar : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var concentrationTextField: UITextField!
    @IBOutlet weak var unitPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let concentrationUnits = ["Molarity", "Molality", "Mass Fraction", "Volume Fraction"]  // Adjust the units as needed

    override func viewDidLoad() {
        super.viewDidLoad()
        
        unitPickerView.delegate = self
        unitPickerView.dataSource = self
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let concentrationText = concentrationTextField.text, let concentration = Double(concentrationText) else {
            resultLabel.text = "Invalid input"
            return
        }
        
        let selectedUnitIndex = unitPickerView.selectedRow(inComponent: 0)
        let convertedResult = convertConcentration(concentration, fromUnit: concentrationUnits[selectedUnitIndex])
        
        resultLabel.text = "Converted Result: \(convertedResult)"
    }
    
    func convertConcentration(_ concentration: Double, fromUnit unit: String) -> Double {
        // Replace this with your actual conversion logic for different concentration units
        switch unit {
        case "Molarity":
            return concentration * 2.0
        case "Molality":
            return concentration * 1.5
        case "Mass Fraction":
            return concentration * 1.2
        case "Volume Fraction":
            return concentration * 1.8
        default:
            return concentration
        }
    }
    
    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return concentrationUnits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return concentrationUnits[row]
    }
}
