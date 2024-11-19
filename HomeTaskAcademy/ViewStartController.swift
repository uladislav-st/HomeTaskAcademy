import UIKit

class ViewStartController: UIViewController {

    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }

    func setupUI() {
        startButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        startButton.center = view.center
        startButton.setTitle("Начать", for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(startButton)
    }

    @objc func startButtonTapped() {
        let mainViewController = ViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true, completion: nil)
    }
}

