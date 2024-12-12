import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsLayout()
        
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        firstView.backgroundColor = .darkGray
        view.addSubview(firstView)
        
        secondView.backgroundColor = .systemBlue
        view.addSubview(secondView)
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(200)
            make.right.equalTo(secondView.snp.left).offset(-16)
        }
        
        secondView.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.left.equalTo(firstView.snp.right).offset(16)
            make.width.height.top.equalTo(firstView)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(16)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    
    @objc func buttonPressed() {
        UIView.animate(withDuration: 1) {
            self.firstView.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(200)
            }
            self.secondView.snp.updateConstraints { make in
                make.top.equalTo(self.firstView.snp.top)
            }
            self.view.layoutIfNeeded()
        }
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "warning", message: "It's not correct", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        let cancelalert = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelalert)
        let destroyAlert = UIAlertAction(title: "Destroy", style: .destructive){ _ in
            print("Wargh!")
        }
        alert.addAction(destroyAlert)
        
        present(alert, animated: true)
    }
}
