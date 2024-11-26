import UIKit

class SecondViewController: UIViewController {
    var receivedText: String?
    var receivedUserInfo: UserInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        guard let text = receivedText else {
            setupFallbackUI(message: "No text provided")
            return
        }
        guard let userInfo = receivedUserInfo else {
            setupFallbackUI(message: "No user info provided")
            return
        }

        setupUI(with: text, userInfo: userInfo)
    }

    private func setupUI(with text: String, userInfo: UserInfo) {
        let textLabel = UILabel()
        textLabel.text = "Message: \(text)"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)

        let userInfoLabel = UILabel()
        userInfoLabel.text = "User: \(userInfo.name), Age: \(userInfo.age)"
        userInfoLabel.textAlignment = .center
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userInfoLabel)

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),

            userInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20)
        ])

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goBackButton)

        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.topAnchor.constraint(equalTo: userInfoLabel.bottomAnchor, constant: 20)
        ])
    }

    private func setupFallbackUI(message: String) {
        let fallbackLabel = UILabel()
        fallbackLabel.text = message
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
