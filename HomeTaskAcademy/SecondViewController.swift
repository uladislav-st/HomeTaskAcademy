
import UIKit
import Foundation
import SwiftUI

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        let label = UILabel()
        label.text = "This is the second screen!"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true

        
        view.addSubview(label)
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Go Back", for: .normal)
        backButton.backgroundColor = .green
        backButton.isUserInteractionEnabled = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            label.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            backButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc private func dismissScreen() {
        dismiss(animated: true, completion: nil)
    }
}
