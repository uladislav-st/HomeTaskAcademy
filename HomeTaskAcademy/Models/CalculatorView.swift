import UIKit

class CalculatorView: UIView {
    var buttonPressed: ((String) -> Void)?
    
    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var buttonViews: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(displayLabel)
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            displayLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Создаем кнопки
        let gridPadding: CGFloat = 12
        let buttonSize: CGFloat = (UIScreen.main.bounds.width - 5 * gridPadding) / 4
        
        for (rowIndex, row) in Constants.buttons.enumerated() {
            for (columnIndex, title) in row.enumerated() {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = title == "=" ? .orange : (["C", "+/-", "%"].contains(title) ? .gray : .darkGray)
                button.layer.cornerRadius = 40
                button.translatesAutoresizingMaskIntoConstraints = false
                button.tag = rowIndex * 4 + columnIndex
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                buttonViews.append(button)
                addSubview(button)
                
                let topAnchor = rowIndex == 0 ? displayLabel.bottomAnchor : buttonViews[(rowIndex - 1) * 4 + columnIndex].bottomAnchor
                let leadingAnchor = columnIndex == 0 ? leadingAnchor : buttonViews[rowIndex * 4 + columnIndex - 1].trailingAnchor
                
                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: topAnchor, constant: gridPadding),
                    button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: columnIndex == 0 ? gridPadding : gridPadding / 2),
                    button.widthAnchor.constraint(equalToConstant: buttonSize),
                    button.heightAnchor.constraint(equalToConstant: buttonSize)
                ])
                
                if columnIndex == 3 {
                    button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -gridPadding).isActive = true
                }
            }
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        buttonPressed?(title)
    }
    
    func updateDisplay(text: String) {
        displayLabel.text = text
    }
}
