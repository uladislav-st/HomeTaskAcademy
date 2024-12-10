import UIKit

class GameViewController: UIViewController {

    let carImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "car"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let totalLanes = 3

    var currentLane: Int = 1

    var roadLineViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        setupCar()

        setupRoadLines()

        startRoadAnimation()

        setupGestures()
    }

    private func setupCar() {
        let laneWidth = view.bounds.width / CGFloat(totalLanes)
        let carSize = CGSize(width: laneWidth * 0.6, height: 100)
        carImageView.frame = CGRect(
            x: laneWidth * CGFloat(currentLane) + laneWidth / 2 - carSize.width / 2,
            y: view.bounds.height - 150,
            width: carSize.width,
            height: carSize.height
        )
        view.addSubview(carImageView)
    }

    private func setupRoadLines() {
        let laneWidth = view.bounds.width / CGFloat(totalLanes)
        let lineWidth: CGFloat = 5
        let lineHeight: CGFloat = 40
        let lineSpacing: CGFloat = 60

        let totalHeight = lineHeight + lineSpacing
        let screenHeight = view.bounds.height

        let totalLines = Int(screenHeight / totalHeight) + 3

        for lane in 1..<totalLanes {
            for i in 0..<totalLines {
                let lineView = UIView()
                lineView.backgroundColor = .white
                lineView.frame = CGRect(
                    x: laneWidth * CGFloat(lane) - lineWidth / 2,
                    y: CGFloat(i) * totalHeight,
                    width: lineWidth,
                    height: lineHeight
                )
                view.addSubview(lineView)
                roadLineViews.append(lineView)
            }
        }
    }

    private func startRoadAnimation() {
        let lineHeight: CGFloat = 40
        let lineSpacing: CGFloat = 60
        let totalHeight = lineHeight + lineSpacing
        let screenHeight = view.bounds.height

        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            for lineView in self.roadLineViews {
                lineView.frame.origin.y += 5

                if lineView.frame.origin.y > screenHeight {
                    lineView.frame.origin.y -= CGFloat(self.roadLineViews.count / (self.totalLanes - 1)) * totalHeight
                }
            }
        }
    }

    private func setupGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }

    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        let laneWidth = view.bounds.width / CGFloat(totalLanes)

        if gesture.direction == .left && currentLane > 0 {
            currentLane -= 1
        } else if gesture.direction == .right && currentLane < totalLanes - 1 {
            currentLane += 1
        }

        UIView.animate(withDuration: 0.2) {
            self.carImageView.frame.origin.x = laneWidth * CGFloat(self.currentLane) + laneWidth / 2 - self.carImageView.frame.width / 2
        }
    }
}
