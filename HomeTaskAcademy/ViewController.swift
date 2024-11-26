import UIKit

class ViewController: UIViewController {
    private var squares: [UIView] = []
    private var widthConstraints: [NSLayoutConstraint] = []
    private var heightConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createSquares()

//        updateSquareSize(at: 0, width: 20, height: 100)
    }

    private func createSquares() {
        let initialWidth: CGFloat = 100
        let initialHeight: CGFloat = 100
        let spacing: CGFloat = 20

        for _ in 0..<4 {
            let square = UIView()
            square.backgroundColor = .magenta
            square.translatesAutoresizingMaskIntoConstraints = false
            squares.append(square)
            view.addSubview(square)
        }

        NSLayoutConstraint.activate([
            // Левый верхний квадрат
            squares[0].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -(initialWidth + spacing) / 2),
            squares[0].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(initialHeight + spacing) / 2),
            
            // Правый верхний квадрат
            squares[1].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (initialWidth + spacing) / 2),
            squares[1].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(initialHeight + spacing) / 2),
            
            // Левый нижний квадрат
            squares[2].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -(initialWidth + spacing) / 2),
            squares[2].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (initialHeight + spacing) / 2),
            
            // Правый нижний квадрат
            squares[3].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (initialWidth + spacing) / 2),
            squares[3].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (initialHeight + spacing) / 2),
        ])

        for square in squares {
            let widthConstraint = square.widthAnchor.constraint(equalToConstant: initialWidth)
            let heightConstraint = square.heightAnchor.constraint(equalToConstant: initialHeight)

            widthConstraint.isActive = true
            heightConstraint.isActive = true

            widthConstraints.append(widthConstraint)
            heightConstraints.append(heightConstraint)
        }
    }

    func updateSquareSize(at index: Int, width: CGFloat, height: CGFloat) {
        guard index >= 0 && index < squares.count else { return }
        widthConstraints[index].constant = width
        heightConstraints[index].constant = height
    }
}
