import UIKit

class ViewController: UIViewController {

    private let circleSize: CGFloat = 50
    private let moveDistance: CGFloat = 20
    private let circleView = UIView()
    private let upButton = UIButton(type: .system)
    private let downButton = UIButton(type: .system)
    private let leftButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCircleView()
        setupButtons()
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
        upButton.addTarget(self, action: #selector(moveCircleUp), for: .touchUpInside)
        view.addSubview(upButton)

        downButton.setTitle("Down", for: .normal)
        downButton.backgroundColor = .systemBlue
        downButton.setTitleColor(.white, for: .normal)
        downButton.addTarget(self, action: #selector(moveCircleDown), for: .touchUpInside)
        view.addSubview(downButton)

        leftButton.setTitle("Left", for: .normal)
        leftButton.backgroundColor = .systemBlue
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.addTarget(self, action: #selector(moveCircleLeft), for: .touchUpInside)
        view.addSubview(leftButton)

        rightButton.setTitle("Right", for: .normal)
        rightButton.backgroundColor = .systemBlue
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.addTarget(self, action: #selector(moveCircleRight), for: .touchUpInside)
        view.addSubview(rightButton)

        layoutButtons(buttonSize: buttonSize)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let buttonSize = CGSize(width: 60, height: 30)
        layoutButtons(buttonSize: buttonSize)
    }

    private func layoutButtons(buttonSize: CGSize) {
        let buttonSpacing: CGFloat = 50
        let centerX = view.bounds.midX
        let bottomY = view.bounds.height - view.safeAreaInsets.bottom - buttonSize.height - 40 // отступ от нижней границы

        upButton.frame = CGRect(x: centerX - buttonSize.width / 2, y: bottomY - buttonSize.height - buttonSpacing, width: buttonSize.width, height: buttonSize.height)
        leftButton.frame = CGRect(x: centerX - buttonSize.width - buttonSpacing, y: bottomY, width: buttonSize.width, height: buttonSize.height)
        downButton.frame = CGRect(x: centerX - buttonSize.width / 2, y: bottomY, width: buttonSize.width, height: buttonSize.height)
        rightButton.frame = CGRect(x: centerX + buttonSpacing, y: bottomY, width: buttonSize.width, height: buttonSize.height)
    }


    @objc private func moveCircleUp() {
        moveCircle(dx: 0, dy: -moveDistance)
    }

    @objc private func moveCircleDown() {
        moveCircle(dx: 0, dy: moveDistance)
    }

    @objc private func moveCircleLeft() {
        moveCircle(dx: -moveDistance, dy: 0)
    }

    @objc private func moveCircleRight() {
        moveCircle(dx: moveDistance, dy: 0)
    }

    private func moveCircle(dx: CGFloat, dy: CGFloat) {
        var newFrame = circleView.frame.offsetBy(dx: dx, dy: dy)
        
        if newFrame.minX < 0 { newFrame.origin.x = 0 }
        if newFrame.maxX > view.bounds.width { newFrame.origin.x = view.bounds.width - circleSize }
        if newFrame.minY < 0 { newFrame.origin.y = 0 }
        if newFrame.maxY > view.bounds.height { newFrame.origin.y = view.bounds.height - circleSize }
        
        let buttons = [upButton, downButton, leftButton, rightButton]
        for button in buttons {
            if newFrame.intersects(button.frame) {
                return
            }
        }
        
        circleView.frame = newFrame
    }
}
