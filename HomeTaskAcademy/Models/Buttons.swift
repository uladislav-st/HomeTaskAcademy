import Foundation
import UIKit

final class Buttons {
    
    static  let createSquareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    static let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CLEAR", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        return button
    }()
}
