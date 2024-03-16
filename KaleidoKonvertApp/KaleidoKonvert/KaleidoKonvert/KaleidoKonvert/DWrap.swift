//
//  DimensionWrap.swift
//  KaleidoKonvert
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

let dimensionWrapUnits = ["small", "medium", "large", "enormous"]

class DWrap : UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var wrapFactorStepper: UIStepper!
    @IBOutlet weak var wrapFactorLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var dimensionWrapConverter = DimensionWrapConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        wrapFactorStepper.minimumValue = 1.0
        wrapFactorStepper.maximumValue = 10.0
        wrapFactorStepper.value = 5.0
        updateWrapFactorLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateWrapFactorLabel()
    }

    func updateWrapFactorLabel() {
        wrapFactorLabel.text = "\(Int(wrapFactorStepper.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnit = DimensionWrapUnit(rawValue: dimensionWrapUnits[inputSegmentedControl.selectedSegmentIndex]),
              let outputUnit = DimensionWrapUnit(rawValue: dimensionWrapUnits[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid unit selection")
            return
        }

        let inputWrapFactor = wrapFactorStepper.value
        let convertedWrapFactor = dimensionWrapConverter.convertWrapFactor(value: inputWrapFactor, fromUnit: inputUnit, toUnit: outputUnit)

        resultLabel.text = "\(Int(inputWrapFactor)) \(inputUnit.rawValue) is equal to \(convertedWrapFactor) \(outputUnit.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum DimensionWrapUnit: String {
    case small
    case medium
    case large
    case enormous
}

struct DimensionWrapConverter {
    func convertWrapFactor(value: Double, fromUnit: DimensionWrapUnit, toUnit: DimensionWrapUnit) -> Double {
        let baseConversionRate = 5.0

        let baseWrapFactor = value / baseConversionRate

        switch fromUnit {
        case .small:
            return baseWrapFactor * 1.0
        case .medium:
            return baseWrapFactor * 2.0
        case .large:
            return baseWrapFactor * 3.0
        case .enormous:
            return baseWrapFactor * 4.0
        }
    }
}
