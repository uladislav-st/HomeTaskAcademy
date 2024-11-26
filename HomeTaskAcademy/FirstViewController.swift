import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let goToSecondButton = UIButton(type: .system)
        goToSecondButton.setTitle("Go next", for: .normal)
        goToSecondButton.addTarget(self, action: #selector(goToSecond), for: .touchUpInside)

        goToSecondButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goToSecondButton)

        NSLayoutConstraint.activate([
            goToSecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToSecondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToSecond() {
        let secondVC = SecondViewController()
        secondVC.receivedText = "Hello from FirstViewController!" 
        navigationController?.pushViewController(secondVC, animated: true)
        
        
        
    }
}
