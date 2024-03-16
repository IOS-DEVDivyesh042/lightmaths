import UIKit

class Volume: UIViewController {

    @IBOutlet weak var inputValueTextField: UITextField!

    @IBAction func convertToLiters(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Liters", conversionFactor: 1.0)
    }

    @IBAction func convertToMilliliters(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Milliliters", conversionFactor: 1000.0)
    }

    @IBAction func convertToGallons(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Gallons", conversionFactor: 0.264172)
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
