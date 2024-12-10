import UIKit

class RecordsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        let label = UIHelper.createLabel(
            text: "Экран рекордов",
            fontSize: 24,
            textColor: .white,
            textAlignment: .center
        )
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
