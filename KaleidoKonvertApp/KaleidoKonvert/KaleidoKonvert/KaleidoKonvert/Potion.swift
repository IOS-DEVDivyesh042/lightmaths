//
//  Potion.swift
//  KaleidoKonvert
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

let potionStrengthUnits = ["drop", "gulp", "flask", "cauldron"]

class Potion: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var potionStrengthStepper: UIStepper!
    @IBOutlet weak var potionStrengthLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var potionConverter = PotionConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        potionStrengthStepper.minimumValue = 1.0
        potionStrengthStepper.maximumValue = 100.0
        potionStrengthStepper.value = 50.0
        updatePotionStrengthLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updatePotionStrengthLabel()
    }

    func updatePotionStrengthLabel() {
        potionStrengthLabel.text = "\(Int(potionStrengthStepper.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnit = PotionStrengthUnit(rawValue: potionStrengthUnits[inputSegmentedControl.selectedSegmentIndex]),
              let outputUnit = PotionStrengthUnit(rawValue: potionStrengthUnits[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid unit selection")
            return
        }

        let inputPotionStrength = potionStrengthStepper.value
        let convertedPotionStrength = potionConverter.convertPotionStrength(value: inputPotionStrength, fromUnit: inputUnit, toUnit: outputUnit)

        resultLabel.text = "\(Int(inputPotionStrength)) \(inputUnit.rawValue) is equal to \(convertedPotionStrength) \(outputUnit.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum PotionStrengthUnit: String {
    case drop
    case gulp
    case flask
    case cauldron
}

struct PotionConverter {
    func convertPotionStrength(value: Double, fromUnit: PotionStrengthUnit, toUnit: PotionStrengthUnit) -> Double {
        let baseConversionRate = 10.0

        let basePotionStrength = value / baseConversionRate

        switch fromUnit {
        case .drop:
            return basePotionStrength * 1.0
        case .gulp:
            return basePotionStrength * 2.0
        case .flask:
            return basePotionStrength * 5.0
        case .cauldron:
            return basePotionStrength * 10.0
        }
    }
}
