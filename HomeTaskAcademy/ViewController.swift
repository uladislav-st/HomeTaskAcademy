import UIKit

class ViewController: UIViewController {
    
    private var calculatorLogic = CalculatorLogic()
    private var calculatorView: CalculatorView!
    
    override func loadView() {
        calculatorView = CalculatorView()
        calculatorView.buttonPressed = { [weak self] title in
            self?.buttonTapped(title)
        }
        view = calculatorView
    }
    
    private func buttonTapped(_ title: String) {
        calculatorLogic.processButtonPress(title)
        calculatorView.updateDisplay(text: calculatorLogic.displayText)
    }
}
