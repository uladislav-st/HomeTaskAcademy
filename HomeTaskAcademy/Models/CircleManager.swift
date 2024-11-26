
import UIKit

class CircleManager {
    private var circles: [UIView] = []
    
    func handleTap(at point: CGPoint, in view: UIView) {
        if let existingCircle = circle(at: point) {
            removeCircleWithAnimation(existingCircle)
        } else {
            let newCircle = createCircle(at: point)
            view.addSubview(newCircle)
            circles.append(newCircle)
            
            removeIntersectingCircles(with: newCircle, in: view)
        }
    }
    
    private func createCircle(at point: CGPoint) -> UIView {
        let size: CGFloat = 50
        let circle = UIView(frame: CGRect(x: point.x - size / 2, y: point.y - size / 2, width: size, height: size))
        circle.backgroundColor = .systemBlue
        circle.layer.cornerRadius = size / 2
        return circle
    }
    
    private func circle(at point: CGPoint) -> UIView? {
        return circles.first { $0.frame.contains(point) }
    }
    
    private func removeIntersectingCircles(with newCircle: UIView, in view: UIView) {
        for circle in circles where circle != newCircle {
            if newCircle.frame.intersects(circle.frame) {
                removeCircleWithAnimation(circle)
            }
        }
        circles.removeAll { $0 != newCircle && newCircle.frame.intersects($0.frame) }
    }
    
    private func removeCircleWithAnimation(_ circle: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            circle.alpha = 0 
        }) { _ in
            circle.removeFromSuperview()
        }
        circles.removeAll { $0 == circle }
    }
}
