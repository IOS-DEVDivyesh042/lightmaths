import UIKit

class Average: UIViewController {

    @IBOutlet weak var numbersTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let inputText = numbersTextField.text else {
            return
        }

        let numberStrings = inputText.components(separatedBy: ",")
        let numbers = numberStrings.compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }

        if numbers.isEmpty {
            resultLabel.text = "Invalid input"
        } else {
            let average = calculateAverage(numbers: numbers)
            resultLabel.text = "Average: \(average)"
        }
    }

    func calculateAverage(numbers: [Double]) -> Double {
        let sum = numbers.reduce(0.0, +)
        let average = sum / Double(numbers.count)
        return average
    }
}
