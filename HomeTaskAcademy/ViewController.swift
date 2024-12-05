import UIKit

class ViewController: UIViewController {
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Старт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var countdownTimer: Timer?
    private var countdownValue = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        
        setupConstraints()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func startButtonTapped() {
        startTimer()
        showDictionary()
    }
    
    private func showDictionary() {
        var dictionary1 = [String: String]()
        dictionary1["key1"] = "value1"
        dictionary1["key2"] = "value2"
        
        var dictionary2 = [String: String]()
        dictionary2["key3"] = "value3"
        dictionary2["key4"] = "value4"
        
        for (key, value) in dictionary2 {
            dictionary1[key] = value
        }
        
        print(dictionary1)
    }
    
    private func startTimer() {
        countdownValue = 5
        timerLabel.text = "\(countdownValue)"
        
        countdownTimer?.invalidate()
        
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.countdownValue -= 1
            self.timerLabel.text = "\(self.countdownValue)"
            
            if self.countdownValue <= 0 {
                timer.invalidate()
                self.countdownTimer = nil
            }
        }
    }
}
