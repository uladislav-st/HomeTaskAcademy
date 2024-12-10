import UIKit

enum Fonts: String {
    case cherolina = "Cherolina"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family) {
                print("-- \(name)")
            }
        }
        
        view.backgroundColor = .white
        
        let text = "Swift text"
        let anotherText = " for people"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.blue,
            .backgroundColor: UIColor.gray
        ]
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        
        let anotherAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        let anotherAttributedString = NSAttributedString(string: anotherText, attributes: anotherAttributes)
        
        attributedString.append(anotherAttributedString)
        
        let label = UILabel()
        label.attributedText = attributedString
        label.textAlignment = .center
        label.numberOfLines = 0
        
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        if let font = UIFont(name: Fonts.cherolina.rawValue, size: 100) {
            label.font = font
        } else {
            print("Шрифт \(Fonts.cherolina.rawValue) не найден")
        }
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            label.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
}
