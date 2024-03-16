import UIKit

class Prime: UIViewController {

    @IBOutlet weak var rangeStartTextField: UITextField!
    @IBOutlet weak var rangeEndTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let primeNumberChecker = PrimeNumberChecker()  // Create an instance

    @IBAction func generateButtonTapped(_ sender: UIButton) {
        guard let rangeStartValue = rangeStartTextField.text,
              let rangeEndValue = rangeEndTextField.text,
              let start = Int(rangeStartValue),
              let end = Int(rangeEndValue),
              start >= 0, end >= start else {
            // Handle invalid input
            resultLabel.text = "Invalid input. Please enter valid numbers."
            return
        }

        let primeNumbers = primeNumberChecker.findPrimesInRange(start: start, end: end)
        resultLabel.text = "Prime Numbers between \(start) and \(end): \(primeNumbers)"
    }
}

class PrimeNumberChecker {
    func isPrime(number: Int) -> Bool {
        guard number > 1 else {
            return false
        }

        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }

        return true
    }

    func findPrimesInRange(start: Int, end: Int) -> [Int] {
        var primes: [Int] = []

        for num in start...end {
            if isPrime(number: num) {
                primes.append(num)
            }
        }

        return primes
    }
}
