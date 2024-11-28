import Foundation

class CalculatorLogic {
    private var firstNumber: Double? = nil
    private var currentOperation: String? = nil
    private var isTypingNumber = false
    
    var displayText: String = "0" {
        didSet {
            if displayText.hasSuffix(".0") {
                displayText = String(displayText.dropLast(2)) 
            }
        }
    }
    func processButtonPress(_ title: String) {
        switch title {
        case "C":
            resetCalculator()
        case "+/-":
            toggleSign()
        case "%":
            applyPercentage()
        case "+", "-", "×", "÷":
            setOperation(title)
        case "=":
            calculateResult()
        default:
            appendNumber(title)
        }
    }
    
    private func resetCalculator() {
        displayText = "0"
        firstNumber = nil
        currentOperation = nil
        isTypingNumber = false
    }
    
    private func toggleSign() {
        if let value = Double(displayText) {
            displayText = String(value * -1)
        }
    }
    
    private func applyPercentage() {
        if let value = Double(displayText) {
            displayText = String(value / 100)
        }
    }
    
    private func setOperation(_ operation: String) {
        firstNumber = Double(displayText)
        currentOperation = operation
        isTypingNumber = false
    }
    
    private func calculateResult() {
        guard let first = firstNumber,
              let second = Double(displayText),
              let operation = currentOperation else {
            return
        }
        switch operation {
        case "+":
            displayText = String(first + second)
        case "-":
            displayText = String(first - second)
        case "×":
            displayText = String(first * second)
        case "÷":
            displayText = second != 0 ? String(first / second) : "Error"
        default:
            break
        }
        firstNumber = nil
        currentOperation = nil
    }
    
    private func appendNumber(_ number: String) {
        if isTypingNumber {
            displayText += number
        } else {
            displayText = number
            isTypingNumber = true
        }
    }
}
