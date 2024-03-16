//
//  TimeWrap.swift
//  KaleidoKonvert
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

let warpSpeedUnits = ["slow", "moderate", "fast", "ludicrous"]

class TimeWrap : UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var warpSpeedStepper: UIStepper!
    @IBOutlet weak var warpSpeedLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var warpSpeedConverter = WarpSpeedConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        warpSpeedStepper.minimumValue = 1.0
        warpSpeedStepper.maximumValue = 10.0
        warpSpeedStepper.value = 5.0
        updateWarpSpeedLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateWarpSpeedLabel()
    }

    func updateWarpSpeedLabel() {
        warpSpeedLabel.text = "\(Int(warpSpeedStepper.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnit = WarpSpeedUnit(rawValue: warpSpeedUnits[inputSegmentedControl.selectedSegmentIndex]),
              let outputUnit = WarpSpeedUnit(rawValue: warpSpeedUnits[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid unit selection")
            return
        }

        let inputWarpSpeed = warpSpeedStepper.value
        let convertedWarpSpeed = warpSpeedConverter.convertWarpSpeed(value: inputWarpSpeed, fromUnit: inputUnit, toUnit: outputUnit)

        resultLabel.text = "\(Int(inputWarpSpeed)) \(inputUnit.rawValue) is equal to \(convertedWarpSpeed) \(outputUnit.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum WarpSpeedUnit: String {
    case slow
    case moderate
    case fast
    case ludicrous
}

struct WarpSpeedConverter {
    func convertWarpSpeed(value: Double, fromUnit: WarpSpeedUnit, toUnit: WarpSpeedUnit) -> Double {
        let baseConversionRate = 5.0

        let baseWarpSpeed = value / baseConversionRate

        switch fromUnit {
        case .slow:
            return baseWarpSpeed * 1.0
        case .moderate:
            return baseWarpSpeed * 2.0
        case .fast:
            return baseWarpSpeed * 3.0
        case .ludicrous:
            return baseWarpSpeed * 4.0
        }
    }
}
