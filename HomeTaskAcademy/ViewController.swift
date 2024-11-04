import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addViewButton(_ sender: UIButton) {
        addView()
    }
    @IBAction func movieViewButton(_ sender: UIButton) {
        myView.frame.origin.y += CGFloat(Int.random(in: 0...200))
    }
    
    func addView( ){
        myView.frame = CGRect(
            x: Int.random(in: 0...400),
            y: Int.random(in: 0...400),
            width: 100,
            height: 100)
        myView.backgroundColor = .cyan
        view.addSubview(myView)
    }

}

