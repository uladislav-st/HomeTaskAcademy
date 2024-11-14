import UIKit

class ViewController: UIViewController {
    
    let squareSize: CGFloat = 100
    let spacing: CGFloat = 5
    var squares: [UIView] = []
    let clear = Buttons.clearButton
    let create = Buttons.createSquareButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(clear)
        view.addSubview(create)
        
        create.addTarget(self, action: #selector(createSquareButtonTapped), for: .touchUpInside)
        clear.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = 100
        let bottomPadding: CGFloat = 20
        
        create.frame = CGRect(
            x: 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        clear.frame = CGRect(
            x: view.frame.width - buttonWidth - 20,
            y: view.frame.height - buttonHeight - bottomPadding,
            width: buttonWidth,
            height: buttonHeight
        )
        
        layoutSquares()
    }
}


