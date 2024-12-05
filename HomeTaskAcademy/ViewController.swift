import UIKit

class ViewController: UIViewController {
    
    let images = ["image1", "image2", "image3"]
    var currentIndex = 0
    
    // UI элементы
    let imageView = UIImageView()
    let nextButton = UIButton()
    let prevButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: images[currentIndex])
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        view.addSubview(imageView)
        
        setupButton(button: prevButton, title: "Назад", action: #selector(prevImage))
        prevButton.frame = CGRect(x: 50, y: view.frame.height - 100, width: 100, height: 50)
        
        setupButton(button: nextButton, title: "Вперед", action: #selector(nextImage))
        nextButton.frame = CGRect(x: view.frame.width - 150, y: view.frame.height - 100, width: 100, height: 50)
        
        view.addSubview(prevButton)
        view.addSubview(nextButton)
    }
    
    func setupButton(button: UIButton, title: String, action: Selector) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    func animateTransition(toNext: Bool) {
        let offset = view.frame.width
        let startTransform = toNext ? CGAffineTransform(translationX: offset, y: 0) : CGAffineTransform(translationX: -offset, y: 0)
        let endTransform = toNext ? CGAffineTransform(translationX: -offset, y: 0) : CGAffineTransform(translationX: offset, y: 0)
        
        let newImageView = UIImageView(image: UIImage(named: images[currentIndex]))
        newImageView.frame = imageView.frame
        newImageView.transform = startTransform
        newImageView.contentMode = .scaleAspectFit
        view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5, animations: {
            newImageView.transform = .identity
            self.imageView.transform = endTransform
        }) { _ in
            self.imageView.image = UIImage(named: self.images[self.currentIndex])
            self.imageView.transform = .identity
            newImageView.removeFromSuperview()
        }
    }
    
    @objc func prevImage() {
        currentIndex = (currentIndex - 1 + images.count) % images.count
        animateTransition(toNext: false)
    }
    
    @objc func nextImage() {
        currentIndex = (currentIndex + 1) % images.count
        animateTransition(toNext: true)
    }
}
