import UIKit
import Foundation
import SwiftUI

class ViewController: UIViewController {
    
    private let textLabelFirst: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .white
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        return label
    }()
    
    private let textLabelSecond: UILabel = {
        let label = UILabel()
        label.text = "Go next!"
        label.textColor = .white
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(textLabelFirst)
        view.addSubview(textLabelSecond)
        
        NSLayoutConstraint.activate([
            textLabelFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabelFirst.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textLabelFirst.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textLabelFirst.heightAnchor.constraint(equalToConstant: 50),
            
            textLabelSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            textLabelSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textLabelSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        let firstLabelTap = UITapGestureRecognizer(target: self, action: #selector(handleFirstLabelTap))
        let secondLabelTap = UITapGestureRecognizer(target: self, action: #selector(handleSecondLabelTap))
        
        textLabelFirst.addGestureRecognizer(firstLabelTap)
        textLabelSecond.addGestureRecognizer(secondLabelTap)
    }

    
    @objc private func handleFirstLabelTap() {
        textLabelFirst.text = (textLabelFirst.text == "Hello") ? "Hi!" : "Hello"
    }
    
    @objc private func handleSecondLabelTap() {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true, completion: nil)
    }
}
