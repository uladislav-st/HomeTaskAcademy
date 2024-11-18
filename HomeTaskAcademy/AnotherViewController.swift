import UIKit
import Foundation

    class AnotherViewController : UIViewController{
        
        private let label: UILabel = {
            let label = UILabel()
            label.textColor = .white
            return label
        }()
        
        var text = ""
        

        override func viewDidLoad(){
            super.viewDidLoad()
            
            view.backgroundColor = .black
            view.addSubview(label)
            label.frame = CGRect(x: 100, y:100, width: 100, height: 50)
            label.text = text
        }
    
        private func codeButtonPressed(){
//            dismiss(animated: true)
            navigationController?.popViewController(animated: true)
        }
}
