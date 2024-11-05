import UIKit

class ViewController: UIViewController {

    let squareSize: CGFloat = 70
    let spacing: CGFloat = 5
    var lastSquarePosition: CGPoint = CGPoint(x: 10, y: 50)
    var squares: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createSquareButton(_ sender: UIButton) {
        let newSquare = UIView()
        newSquare.backgroundColor = .randomColor()
        newSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newSquare)
        
        newSquare.frame = CGRect(
            origin: lastSquarePosition,
            size: CGSize(width: squareSize, height: squareSize)
        )

        squares.append(newSquare)
        
        if let buttonFrame = sender.superview?.convert(sender.frame, to: view) {
            let maxSafeHeight = buttonFrame.minY - spacing
            
            if lastSquarePosition.y + squareSize > maxSafeHeight {
                return
            }
        }
        
        if lastSquarePosition.x + squareSize + spacing + squareSize <= view.safeAreaLayoutGuide.layoutFrame.width {
            // Если в строке есть место, двигаемся вправо
            lastSquarePosition.x += squareSize + spacing
        } else {
            lastSquarePosition.x = 10
            lastSquarePosition.y += squareSize + spacing
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {

        squares.forEach { $0.removeFromSuperview() }
        squares.removeAll()
        lastSquarePosition = CGPoint(x: 10, y: 50)
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
