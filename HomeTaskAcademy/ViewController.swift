import UIKit

class ViewController: UIViewController {

    let squareSize: CGFloat = 70
    let spacing: CGFloat = 5
    var squares: [UIView] = []
    
    // Создаем кнопки
    let createSquareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CLEAR", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем кнопки на экран
        view.addSubview(createSquareButton)
        view.addSubview(clearButton)
        
        // Устанавливаем действия для кнопок
        createSquareButton.addTarget(self, action: #selector(createSquareButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutSquares()
    }
    
    @objc func createSquareButtonTapped() {
        let newSquare = UIView()
        newSquare.backgroundColor = .randomColor()
        newSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newSquare)
        
        squares.append(newSquare)
        layoutSquares()
    }
    
    @objc func clearButtonTapped() {
        squares.forEach { $0.removeFromSuperview() }
        squares.removeAll()
    }
    
    private func layoutSquares() {
        var position = CGPoint(x: 10, y: 50)
        
        // Проверяем, до какого места можно размещать квадраты, чтобы не перекрывать кнопку
        let maxSafeHeight: CGFloat = createSquareButton.frame.minY - spacing
        
        for square in squares {
            // Если следующий квадрат не помещается справа, переносим его на новую строку
            if position.x + squareSize > view.safeAreaLayoutGuide.layoutFrame.width {
                position.x = 10
                position.y += squareSize + spacing
            }
            
            // Если следующий ряд не помещается, прекращаем размещение
            if position.y + squareSize > maxSafeHeight {
                break
            }
            
            // Устанавливаем новое положение квадрата
            square.frame = CGRect(origin: position, size: CGSize(width: squareSize, height: squareSize))
            position.x += squareSize + spacing
        }
    }
    
    private func setupConstraints() {
        // Ограничения для кнопки "Create Square"
        NSLayoutConstraint.activate([
            createSquareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            createSquareButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            createSquareButton.heightAnchor.constraint(equalToConstant: 50),
            createSquareButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        // Ограничения для кнопки "Clear"
        NSLayoutConstraint.activate([
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            clearButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            clearButton.heightAnchor.constraint(equalToConstant: 50),
            clearButton.widthAnchor.constraint(equalToConstant: 100)
        ])
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
