import UIKit

class ViewController: UIViewController {
    
    let squareSize: CGFloat = 70
    let spacing: CGFloat = 5
    var squares: [UIView] = []
    
    let createSquareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CLEAR", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createSquareButton)
        view.addSubview(clearButton)
        
        createSquareButton.addTarget(self, action: #selector(createSquareButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = 100
        let bottomPadding: CGFloat = 20
        
        createSquareButton.frame = CGRect(
            x: 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        clearButton.frame = CGRect(
            x: view.frame.width - buttonWidth - 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        layoutSquares()
    }
}

private extension ViewController {
    
    @objc func createSquareButtonTapped() {
        let newSquare = UIView()
        newSquare.backgroundColor = .randomColor()
        view.addSubview(newSquare)
        
        squares.append(newSquare)
        layoutSquares()
    }
    
    @objc func clearButtonTapped() {
        squares.forEach { $0.removeFromSuperview() }
        squares.removeAll()
    }
    
    func layoutSquares() {
        var position = CGPoint(x: 10, y: 50)
        
        let maxSafeHeight: CGFloat = createSquareButton.frame.minY - spacing
        
        for square in squares {
            if position.x + squareSize > view.frame.width {
                position.x = 10
                position.y += squareSize + spacing
            }
            
            if position.y + squareSize > maxSafeHeight {
                break
            }
            
            square.frame = CGRect(origin: position, size: CGSize(width: squareSize, height: squareSize))
            
            position.x += squareSize + spacing
        }
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
}
