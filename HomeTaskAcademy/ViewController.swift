import UIKit
import Foundation


class ViewController: UIViewController {
    private let text = "Text sweat kitty"
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .cyan
        return button
    }()
    
    private let pressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle", for: .normal)
        button.backgroundColor = .brown
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(button)
        view.addSubview(pressButton)
        

        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        let action = UIAction{ _ in self.buttonTap()}
        button.addAction(action, for: .touchUpInside)
    }

    private func buttonTap(){
        let controller = AnotherViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.text = text
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

