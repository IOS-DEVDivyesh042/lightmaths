//
//  Illumination.swift
//  LuminaWiz
//
//  Created by Manish Bhanushali on 01/11/23.
//

import UIKit

class Illumination: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var fromUnitPickerView: UIPickerView!
    @IBOutlet weak var toUnitPickerView: UIPickerView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    let illuminationUnits = ["(lx)", "(fc)", "(cd/m²)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        fromUnitPickerView.dataSource = self
        fromUnitPickerView.delegate = self
        toUnitPickerView.dataSource = self
        toUnitPickerView.delegate = self
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return illuminationUnits.count
    }

   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return illuminationUnits[row]
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        if let inputText = inputTextField.text, let inputValue = Double(inputText) {
            let fromUnitIndex = fromUnitPickerView.selectedRow(inComponent: 0)
            let toUnitIndex = toUnitPickerView.selectedRow(inComponent: 0)
            
            
            let conversionFactors: [Double] = [1.0, 10.7639, 1.0]
            
            if fromUnitIndex < conversionFactors.count && toUnitIndex < conversionFactors.count {
                let conversionFactorFrom = conversionFactors[fromUnitIndex]
                let conversionFactorTo = conversionFactors[toUnitIndex]
                
                let result = (inputValue * conversionFactorFrom) / conversionFactorTo
                resultLabel.text = "\(result)"
            }
        }
    }
}
