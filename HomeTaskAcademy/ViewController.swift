import UIKit

class ViewController: UIViewController {
    
    var squareSize: CGFloat = 100
    let spacing: CGFloat = 5
    var squares: [UIView] = []
    
    let clear = Buttons.clearButton
    let create = Buttons.createSquareButton
    
    let sizeInput: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Size"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.backgroundColor = .white
        return textField
    }()
    
    let predefinedColors: [(color: UIColor, name: String)] = [
        (color: .red, name: "Red"),
        (color: .green, name: "Green"),
        (color: .blue, name: "Blue"),
        (color: .yellow, name: "Yellow"),
        (color: .magenta, name: "Magenta"),
        (color: .cyan, name: "Cyan"),
        (color: .black, name: "Black"),
        (color: .white, name: "White"),
        (color: UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0), name: "Pink")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(clear)
        view.addSubview(create)
        view.addSubview(sizeInput)
        
        create.addTarget(self, action: #selector(createSquareButtonTapped), for: .touchUpInside)
        clear.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = 100
        let bottomPadding: CGFloat = 20
        
        sizeInput.frame = CGRect(
            x: 20,
            y: view.safeAreaInsets.top + 10,
            width: view.frame.width - 40,
            height: 40
        )
        
        create.frame = CGRect(
            x: 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        clear.frame = CGRect(
            x: view.frame.width - buttonWidth - 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        layoutSquares()
    }
}
