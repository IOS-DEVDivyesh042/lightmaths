import UIKit

class Even: UIViewController {

    @IBOutlet weak var rangeStartTextField: UITextField!
    @IBOutlet weak var rangeEndTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let evenNumberGenerator = EvenNumberGenerator()

    @IBAction func generateButtonTapped(_ sender: UIButton) {
        guard let rangeStartValue = rangeStartTextField.text, let rangeEndValue = rangeEndTextField.text,
              let start = Int(rangeStartValue), let end = Int(rangeEndValue) else {
            return
        }

        let evenNumbers = evenNumberGenerator.generateEvenNumbers(start: start, end: end)
        resultLabel.text = "Even Numbers between \(start) and \(end): \(evenNumbers)"
    }
}

class EvenNumberGenerator {
    func generateEvenNumbers(start: Int, end: Int) -> [Int] {
        var evenNumbers: [Int] = []

        for num in start...end {
            if num % 2 == 0 {
                evenNumbers.append(num)
            }
        }

        return evenNumbers
    }
}

