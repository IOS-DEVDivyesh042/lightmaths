import UIKit

class Temp: UIViewController {

    @IBOutlet weak var inputValueTextField: UITextField!

    @IBAction func convertToFahrenheit(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Fahrenheit", conversionFactor: 9/5, offset: 32)
    }

    @IBAction func convertToCelsius(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Celsius", conversionFactor: 5/9, offset: -32)
    }

    @IBAction func convertToKelvin(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Kelvin", conversionFactor: 5/9, offset: 273.15)
    }

    func performConversionAndShowAlert(unitTitle: String, conversionFactor: Double, offset: Double) {
        if let inputValueText = inputValueTextField.text, let inputValue = Double(inputValueText) {
            let result = inputValue * conversionFactor + offset
            showAlert(message: "\(inputValue) \(unitTitle) is approximately \(result) \(unitTitle).")
        } else {
            showAlert(message: "Please enter a valid numerical value.")
        }
    }

    // Move showAlert inside the class without using @objc
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Conversion Result", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
