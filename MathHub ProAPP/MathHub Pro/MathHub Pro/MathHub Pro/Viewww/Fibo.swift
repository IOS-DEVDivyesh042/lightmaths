import UIKit
import BigInt

class Fibo: UIViewController {

    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let inputText = termTextField.text, let term = Int(inputText) else {
            resultLabel.text = "Invalid input"
            return
        }

        let fibonacciSequence = calculateFibonacciSequence(term: term)
        resultLabel.text = "Fibonacci Sequence: \(fibonacciSequence)"
    }

    func calculateFibonacciSequence(term: Int) -> [BigInt] {
        var sequence = [BigInt]()

        for i in 0..<term {
            if i <= 1 {
                sequence.append(BigInt(i))
            } else {
                let nextTerm = sequence[i - 1] + sequence[i - 2]
                sequence.append(nextTerm)
            }
        }

        return sequence
    }
}
