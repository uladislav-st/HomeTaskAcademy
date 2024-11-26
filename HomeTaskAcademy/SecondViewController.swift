import UIKit

class SecondViewController: UIViewController {
    var receivedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        guard let text = receivedText else {
            print("No text received!")
            setupFallbackUI()
            return
        }

        setupUI(with: text)
    }

    private func setupUI(with text: String) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goBackButton)

        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }

    private func setupFallbackUI() {
        let fallbackLabel = UILabel()
        fallbackLabel.text = "No text provided"
        fallbackLabel.textAlignment = .center
        fallbackLabel.textColor = .red
        fallbackLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fallbackLabel)

        NSLayoutConstraint.activate([
            fallbackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fallbackLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goBackButton)

        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.topAnchor.constraint(equalTo: fallbackLabel.bottomAnchor, constant: 20)
        ])
    }

    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
