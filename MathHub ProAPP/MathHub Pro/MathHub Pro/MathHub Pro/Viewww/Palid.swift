import UIKit

class Palid: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let palindromeChecker = PalindromeChecker()

    @IBAction func checkButtonTapped(_ sender: UIButton) {
        guard let inputValue = inputTextField.text, let number = Int(inputValue) else {
            resultLabel.text = "Invalid input"
            return
        }

        let isPalindrome = palindromeChecker.isPalindrome(number: number)
        resultLabel.text = isPalindrome ? "Palindrome Number" : "Not a Palindrome Number"
    }
}

class PalindromeChecker {
    func isPalindrome(number: Int) -> Bool {
        let numberString = String(number)
        return numberString == String(numberString.reversed())
    }
}

