import UIKit
import SnapKit

class ViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label)

        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save button", for: .normal)
        saveButton.addTarget(self, action: #selector(saveText), for: .touchUpInside)
        self.view.addSubview(saveButton)

        let loadButton = UIButton(type: .system)
        loadButton.setTitle("Load button", for: .normal)
        loadButton.addTarget(self, action: #selector(loadText), for: .touchUpInside)
        self.view.addSubview(loadButton)

        label.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }

        saveButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        loadButton.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func saveText() {
        StorageManager.shared.save()
    }

    @objc private func loadText() {
        if let loadedModel = StorageManager.shared.load() {
            label.text = loadedModel.name
        } else {
            label.text = "No data found"
        }
    }
}
