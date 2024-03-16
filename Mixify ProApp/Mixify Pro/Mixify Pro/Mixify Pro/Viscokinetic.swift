//
//  Viscokinetic.swift
//  BlendifyPro
//
//  Created by Manish Bhanushali on 11/11/23.
//

import UIKit

class Viscokinetic : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var viscosityTextField: UITextField!
    @IBOutlet weak var unitPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viscosityUnits = ["Stokes", "cSt", "m²/s", "ft²/s", "in²/s"]  // Adjust the units as needed

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
        // Replace this with your actual conversion logic for different viscosity units
        switch unit {
        case "Stokes":
            return viscosity * 2.0
        case "cSt":
            return viscosity * 1.5
        case "m²/s":
            return viscosity * 1.2
        case "ft²/s":
            return viscosity * 1.8
        case "in²/s":
            return viscosity * 1.3
        default:
            return viscosity
        }
    }
    
    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource
    
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

