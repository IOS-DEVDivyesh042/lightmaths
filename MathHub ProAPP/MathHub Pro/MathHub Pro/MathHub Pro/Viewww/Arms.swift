import UIKit

class Arms: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let armstrongNumberChecker = ArmstrongNumberChecker()

    @IBAction func checkButtonTapped(_ sender: UIButton) {
        guard let inputValue = inputTextField.text, let number = Int(inputValue) else {
            resultLabel.text = "Invalid input"
            return
        }

        let isArmstrong = armstrongNumberChecker.isArmstrongNumber(number: number)
        resultLabel.text = isArmstrong ? "\(number) is an Armstrong Number" : "\(number) is not an Armstrong Number"
    }
}

class ArmstrongNumberChecker {
    func isArmstrongNumber(number: Int) -> Bool {
        let digits = String(number).compactMap { Int(String($0)) }
        let power = digits.count
        
        let sum = digits.reduce(0) { $0 + Int(pow(Double($1), Double(power))) }
        
        return sum == number
    }
}
