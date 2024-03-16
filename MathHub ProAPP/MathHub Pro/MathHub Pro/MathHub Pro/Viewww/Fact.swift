import UIKit
import BigInt

class Fact: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let inputText = numberTextField.text, let number = Int(inputText) else {
            resultLabel.text = "Invalid input"
            return
        }

        let factorial = calculateFactorial(number: BigInt(number))
        resultLabel.text = "Factorial: \(factorial)"
    }

    func calculateFactorial(number: BigInt) -> BigInt {
        if number == 0 || number == 1 {
            return 1
        } else {
            return number * calculateFactorial(number: number - 1)
        }
    }
}
