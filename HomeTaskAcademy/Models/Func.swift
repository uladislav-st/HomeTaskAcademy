import Foundation
import UIKit

extension ViewController {
    
    @objc func createSquareButtonTapped() {
        guard let inputText = sizeInput.text, let inputDouble = Double(inputText), inputDouble > 0 else {
            squareSize = 100
            return
        }
        
        squareSize = CGFloat(inputDouble)
        
        let randomColor = predefinedColors.randomElement()!
        let squareColor = randomColor.color
        let colorName = randomColor.name
        
        let newSquare = UIView()
        newSquare.backgroundColor = squareColor
        
        let colorLabel = UILabel()
        colorLabel.text = colorName
        colorLabel.textColor = (squareColor == .black || squareColor == .blue) ? .white : .black
        colorLabel.font = UIFont.systemFont(ofSize: 10)
        colorLabel.textAlignment = .center
        colorLabel.frame = CGRect(x: 0, y: 0, width: squareSize, height: squareSize)
        newSquare.addSubview(colorLabel)
        
        view.addSubview(newSquare)
        squares.append(newSquare)
        layoutSquares()
    }
    
    @objc func clearButtonTapped() {
        squares.forEach { $0.removeFromSuperview() }
        squares.removeAll()
    }
    
    func layoutSquares() {
        var position = CGPoint(x: 10, y: sizeInput.frame.maxY + 10)
        let maxSafeHeight: CGFloat = create.frame.minY - spacing
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
