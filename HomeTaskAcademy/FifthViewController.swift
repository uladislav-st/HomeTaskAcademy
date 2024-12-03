import UIKit

class FifthViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name: \(customObject?.name ?? "Unknown")"
        view.addSubview(nameLabel)
        
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "Age: \(customObject?.age ?? 0)"
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }
    override func nextButtonTapped() {
        // Вернуться к корневому контроллеру (первому экрану)
        navigationController?.popToRootViewController(animated: true)
    }
}
