import UIKit

class Weight : UIViewController {

    @IBOutlet weak var inputValueTextField: UITextField!

    @IBAction func convertToPounds(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Pounds", conversionFactor: 2.20462)
    }

    @IBAction func convertToKilograms(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Kilograms", conversionFactor: 1.0)
    }

    @IBAction func convertToGrams(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Grams", conversionFactor: 1000.0)
    }

    func performConversionAndShowAlert(unitTitle: String, conversionFactor: Double) {
        if let inputValueText = inputValueTextField.text, let inputValue = Double(inputValueText) {
            let result = inputValue * conversionFactor
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
