import UIKit

class ViewStartController: UIViewController {

    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }

    func setupUI() {
//        startButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        startButton.center = view.center
        startButton.setTitle("Начать", for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.layer.cornerRadius=10
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: Constants.Layout.buttonHeight ),
            startButton.widthAnchor.constraint(equalToConstant: Constants.Layout.buttonWidth ),
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            
        ])
    }

    @objc func startButtonTapped() {
        let mainViewController = ViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true, completion: nil)
    }
}

