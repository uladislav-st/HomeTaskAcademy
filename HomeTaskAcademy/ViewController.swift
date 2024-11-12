import UIKit

enum MoveDirection {
    case up, down, left, right
}

class ViewController: UIViewController {

    private let circleSize: CGFloat = 20
    private let moveDistance: CGFloat = 20
    private let circleView = UIView()
    private let upButton = UIButton(type: .system)
    private let downButton = UIButton(type: .system)
    private let leftButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)
    private let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCircleView()
        setupButtons()
        setupStatusLabel()
    }

    private func setupCircleView() {
        circleView.frame = CGRect(x: view.bounds.midX - circleSize / 2, y: view.bounds.midY - circleSize / 2, width: circleSize, height: circleSize)
        circleView.backgroundColor = .blue
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
    }

    private func setupButtons() {
        let buttonSize = CGSize(width: 50, height: 50)
        
        upButton.setTitle("Up", for: .normal)
        upButton.backgroundColor = .systemBlue
        upButton.setTitleColor(.white, for: .normal)
        upButton.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        upButton.tag = 0
        view.addSubview(upButton)

        downButton.setTitle("Down", for: .normal)
        downButton.backgroundColor = .systemBlue
        downButton.setTitleColor(.white, for: .normal)
        downButton.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        downButton.tag = 1
        view.addSubview(downButton)

        leftButton.setTitle("Left", for: .normal)
        leftButton.backgroundColor = .systemBlue
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        leftButton.tag = 2
        view.addSubview(leftButton)

        rightButton.setTitle("Right", for: .normal)
        rightButton.backgroundColor = .systemBlue
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        rightButton.tag = 3
        view.addSubview(rightButton)

        layoutButtons(buttonSize: buttonSize)
    }

    private func setupStatusLabel() {
        statusLabel.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 30)
        statusLabel.textAlignment = .center
        statusLabel.textColor = .black
        statusLabel.text = "Готов"
        view.addSubview(statusLabel)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let buttonSize = CGSize(width: 60, height: 30)
        layoutButtons(buttonSize: buttonSize)
    }

    private func layoutButtons(buttonSize: CGSize) {
        let buttonSpacing: CGFloat = 50
        let centerX = view.bounds.midX
        let bottomY = view.bounds.height - view.safeAreaInsets.bottom - buttonSize.height - 40

        upButton.frame = CGRect(x: centerX - buttonSize.width / 2, y: bottomY - buttonSize.height - buttonSpacing, width: buttonSize.width, height: buttonSize.height)
        leftButton.frame = CGRect(x: centerX - buttonSize.width - buttonSpacing, y: bottomY, width: buttonSize.width, height: buttonSize.height)
        downButton.frame = CGRect(x: centerX - buttonSize.width / 2, y: bottomY, width: buttonSize.width, height: buttonSize.height)
        rightButton.frame = CGRect(x: centerX + buttonSpacing, y: bottomY, width: buttonSize.width, height: buttonSize.height)
    }

    @objc private func moveCircle(_ sender: UIButton) {
        let direction: MoveDirection
        switch sender.tag {
        case 0: direction = .up
        case 1: direction = .down
        case 2: direction = .left
        case 3: direction = .right
        default: return
        }
        
        if moveCircle(to: direction) {
            updateStatusLabel(with: direction)
        }
    }

    private func moveCircle(to direction: MoveDirection) -> Bool {
        var dx: CGFloat = 0
        var dy: CGFloat = 0

        switch direction {
        case .up: dy = -moveDistance
        case .down: dy = moveDistance
        case .left: dx = -moveDistance
        case .right: dx = moveDistance
        }

        let newFrame = circleView.frame.offsetBy(dx: dx, dy: dy)

        if newFrame.minX < 0 {
            statusLabel.text = "Невозможно сдвинуться влево"
            return false
        }
        if newFrame.maxX > view.bounds.width {
            statusLabel.text = "Невозможно двигаться вправо"
            return false
        }
        if newFrame.minY < 0 {
            statusLabel.text = "Невозможно двигаться вверх"
            return false
        }
        if newFrame.maxY > view.bounds.height {
            statusLabel.text = "Невозможно двигаться вниз"
            return false
        }

        let buttons = [upButton, downButton, leftButton, rightButton]
        for button in buttons {
            if newFrame.intersects(button.frame) {
                statusLabel.text = "Невозможно переместить"
                return false
            }
        }

        circleView.frame = newFrame
        return true
    }

    private func updateStatusLabel(with direction: MoveDirection) {
        switch direction {
        case .up: statusLabel.text = "Вверх"
        case .down: statusLabel.text = "Вниз"
        case .left: statusLabel.text = "Влево"
        case .right: statusLabel.text = "Вправо"
        }
    }
}
