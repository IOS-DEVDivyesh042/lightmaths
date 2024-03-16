import UIKit

class Length : UIViewController {

    @IBOutlet weak var inputValueTextField: UITextField!

    @IBAction func convertToFeet(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Feet", conversionFactor: 3.28084)
    }

    @IBAction func convertToMeters(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Meters", conversionFactor: 1.0)
    }

    @IBAction func convertToKilometers(_ sender: UIButton) {
        performConversionAndShowAlert(unitTitle: "Kilometers", conversionFactor: 0.001)
    }

    func performConversionAndShowAlert(unitTitle: String, conversionFactor: Double) {
        if let inputValueText = inputValueTextField.text, let inputValue = Double(inputValueText) {
            let result = inputValue * conversionFactor
            showAlert(message: "\(inputValue) \(unitTitle) is approximately \(result) \(unitTitle).")
        } else {
            showAlert(message: "Please enter a valid numerical value.")
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Conversion Result", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
