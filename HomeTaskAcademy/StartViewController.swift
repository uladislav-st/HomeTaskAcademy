import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        let titleLabel = UIHelper.createLabel(
            text: "Гоночная Игра",
            fontSize: 32,
            textColor: .white,
            textAlignment: .center
        )

        let startButton = UIHelper.createButton(title: "Начать игру", action: #selector(startGame), target: self)
        let optionsButton = UIHelper.createButton(title: "Опции", action: #selector(openOptions), target: self)
        let recordsButton = UIHelper.createButton(title: "Рекорды", action: #selector(openRecords), target: self)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, startButton, optionsButton, recordsButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            optionsButton.widthAnchor.constraint(equalToConstant: 200),
            recordsButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func startGame() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }

    @objc private func openOptions() {
        let optionsVC = OptionsViewController()
        navigationController?.pushViewController(optionsVC, animated: true)
    }

    @objc private func openRecords() {
        let recordsVC = RecordsViewController()
        navigationController?.pushViewController(recordsVC, animated: true)
    }
}
