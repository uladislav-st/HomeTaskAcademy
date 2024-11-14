import Foundation
import UIKit

extension ViewController {
    
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
