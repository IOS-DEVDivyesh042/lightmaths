import UIKit

class ODD: UIViewController {

    @IBOutlet weak var rangeStartTextField: UITextField!
    @IBOutlet weak var rangeEndTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let oddNumberGenerator = OddNumberGenerator()

    @IBAction func generateButtonTapped(_ sender: UIButton) {
        guard let rangeStartValue = rangeStartTextField.text, let rangeEndValue = rangeEndTextField.text,
              let start = Int(rangeStartValue), let end = Int(rangeEndValue) else {
            return
        }

        let oddNumbers = oddNumberGenerator.generateOddNumbers(start: start, end: end)
        resultLabel.text = "Odd Numbers between \(start) and \(end): \(oddNumbers)"
    }
}

class OddNumberGenerator {
    func generateOddNumbers(start: Int, end: Int) -> [Int] {
        var oddNumbers: [Int] = []

        for num in start...end {
            if num % 2 != 0 {
                oddNumbers.append(num)
            }
        }

        return oddNumbers
    }
}

