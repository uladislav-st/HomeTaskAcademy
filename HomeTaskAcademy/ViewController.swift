import UIKit

class ViewController: UIViewController {
// create image
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "catToy")
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: 150, height: 150) // Размер изображения
        return imageView
    }()
    
    let topPadding: CGFloat = 50
    let bottomPadding: CGFloat = 20
    var tapCount: Int = 0
    
    let tapCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Taps: 0"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandomPosition()

        view.addSubview(imageView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(tapCountLabel)
        setupTapCountLabelConstraints()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didChangeOrientation),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }

    @objc func imageTapped() {
        tapCount += 1
        tapCountLabel.text = "Taps: \(tapCount)"
        setRandomPosition()
    }

    @objc func didChangeOrientation() {
        setRandomPosition()
    }

    private func setRandomPosition() {
        let screenWidth = view.bounds.width
        let screenHeight = view.bounds.height
        let imageSize = imageView.frame.size
        let randomX = CGFloat.random(in: 0...(screenWidth - imageSize.width))
        let randomY = CGFloat.random(in: topPadding...(screenHeight - imageSize.height - bottomPadding))
        
        imageView.frame.origin = CGPoint(x: randomX, y: randomY)
    }
    
    private func setupTapCountLabelConstraints() {
        NSLayoutConstraint.activate([
            tapCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tapCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
