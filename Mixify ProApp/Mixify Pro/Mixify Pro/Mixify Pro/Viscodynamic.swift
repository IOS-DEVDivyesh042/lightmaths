//
//  Viscodynamic.swift
//  BlendifyPro
//
//  Created by Manish Bhanushali on 11/11/23.
//

import UIKit

class Viscodynamic : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var viscosityTextField: UITextField!
    @IBOutlet weak var unitPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viscosityUnits = ["Pa·s", "cP", "Poise", "lb/(ft·s)", "lb/(ft·h)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        unitPickerView.delegate = self
        unitPickerView.dataSource = self
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let viscosityText = viscosityTextField.text, let viscosity = Double(viscosityText) else {
            resultLabel.text = "Invalid input"
            return
        }
        
        let selectedUnitIndex = unitPickerView.selectedRow(inComponent: 0)
        let convertedResult = convertViscosity(viscosity, fromUnit: viscosityUnits[selectedUnitIndex])
        
        resultLabel.text = "Converted Result: \(convertedResult)"
    }
    
    func convertViscosity(_ viscosity: Double, fromUnit unit: String) -> Double {
        
        switch unit {
        case "Pa·s":
            return viscosity * 2.0
        case "cP":
            return viscosity * 1.5
        case "Poise":
            return viscosity * 1.2
        case "lb/(ft·s)":
            return viscosity * 1.8
        case "lb/(ft·h)":
            return viscosity * 1.3
        default:
            return viscosity
        }
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viscosityUnits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viscosityUnits[row]
    }
}
