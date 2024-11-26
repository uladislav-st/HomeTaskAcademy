import UIKit

class ViewController: UIViewController {
    
    let circle = UIView()
    //    let topContainer = UIView()
    //    let bottomContainer = UIView()
    //    let backButton = UIButton(type: .system)
    //    let textTitle = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        topContainer.backgroundColor = .lightGray
        //        view.addSubview(topContainer)
        //        bottomContainer.backgroundColor = .white
        //        view.addSubview(bottomContainer)
        //
        //        backButton.setTitle("< Back", for: .normal)
        //        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //        textTitle.text = "Main"
        //        textTitle.textAlignment = .center
        //        textTitle.font = UIFont.boldSystemFont(ofSize: 18)
        //
        //        topContainer.addSubview(backButton)
        //        topContainer.addSubview(textTitle)
        //
        //        topContainer.translatesAutoresizingMaskIntoConstraints = false
        //        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        //        backButton.translatesAutoresizingMaskIntoConstraints = false
        //        textTitle.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            topContainer.topAnchor.constraint(equalTo: view.topAnchor),
        //            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //            topContainer.heightAnchor.constraint(equalToConstant: 100)
        //        ])
        //
        //        NSLayoutConstraint.activate([
        //            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
        //            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        //        ])
        //
        //        NSLayoutConstraint.activate([
        //            backButton.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 16),
        //            backButton.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor),
        //            backButton.heightAnchor.constraint(equalToConstant: 30),
        //            backButton.widthAnchor.constraint(equalToConstant: 80)
        //        ])
        //
        //        NSLayoutConstraint.activate([
        //            textTitle.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor),
        //            textTitle.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor)
        //        ])
        
        view.addSubview(circle)
        circle.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        circle.center = view.center
        circle.layer.cornerRadius = 50
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.black.cgColor
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipedDown))
        swipeDown.direction = .down
        circle.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        circle.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        circle.addGestureRecognizer(swipeRight)
        
        let swipeTop = UISwipeGestureRecognizer(target: self, action: #selector(swipedTop))
        swipeTop.direction = .up
        circle.addGestureRecognizer(swipeTop)
        
        circle.isUserInteractionEnabled = true
    }
    
    
    
    @objc func swipedDown(){
        UIView.animate(withDuration: 0.3){
            self.circle.frame.origin.y += 250
            self.circle.backgroundColor = .red
        } completion: { _ in
            self.circle.backgroundColor = .clear
        }
    }
    
    @objc func swipedTop(){
        UIView.animate(withDuration: 0.3) {
            self.circle.frame.origin.y -= 250
            self.circle.backgroundColor = .green
        }completion: { _ in
            self.circle.backgroundColor = .clear
        }
    }
    
    @objc func swipedLeft(){
        UIView.animate(withDuration: 0.3) {
            self.circle.frame.origin.x -= 50
            self.circle.backgroundColor = .cyan
        } completion: { _ in
            self.circle.backgroundColor = .clear
        }
    }
    @objc func swipedRight(){
        UIView.animate(withDuration: 0.3) {
            self.circle.frame.origin.x += 50
            self.circle.backgroundColor = .systemPink
        } completion: { _ in
            self.circle.backgroundColor = .clear
        }
    }
}
