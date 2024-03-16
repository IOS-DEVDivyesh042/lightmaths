//
//  Power.swift
//  KaleidoKonvert
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

let powerLevelUnits = ["scouter", "saiyan", "kaioken", "superSaiyan"]

class Power: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var powerLevelStepper: UIStepper!
    @IBOutlet weak var powerLevelLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var powerLevelConverter = PowerLevelConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        powerLevelStepper.minimumValue = 1.0
        powerLevelStepper.maximumValue = 10000.0
        powerLevelStepper.value = 1000.0
        updatePowerLevelLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updatePowerLevelLabel()
    }

    func updatePowerLevelLabel() {
        powerLevelLabel.text = "\(Int(powerLevelStepper.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnit = PowerLevelUnit(rawValue: powerLevelUnits[inputSegmentedControl.selectedSegmentIndex]),
              let outputUnit = PowerLevelUnit(rawValue: powerLevelUnits[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid unit selection")
            return
        }

        let inputPowerLevel = powerLevelStepper.value
        let convertedPowerLevel = powerLevelConverter.convertPowerLevel(value: inputPowerLevel, fromUnit: inputUnit, toUnit: outputUnit)

        resultLabel.text = "\(Int(inputPowerLevel)) \(inputUnit.rawValue) is equal to \(convertedPowerLevel) \(outputUnit.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum PowerLevelUnit: String {
    case scouter
    case saiyan
    case kaioken
    case superSaiyan
}

struct PowerLevelConverter {
    func convertPowerLevel(value: Double, fromUnit: PowerLevelUnit, toUnit: PowerLevelUnit) -> Double {
        let baseConversionRate = 1000.0

        let basePowerLevel = value / baseConversionRate

        switch fromUnit {
        case .scouter:
            return basePowerLevel * 1.0
        case .saiyan:
            return basePowerLevel * 10.0
        case .kaioken:
            return basePowerLevel * 100.0
        case .superSaiyan:
            return basePowerLevel * 1000.0
        }
    }
}
