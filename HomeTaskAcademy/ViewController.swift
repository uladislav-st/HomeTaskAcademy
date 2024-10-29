import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var saleTextLabel: UILabel!
    
    var products: [(name: String, quantity: Int)] = [
        ("Old Bobby", 0),
        ("Lidskae", 0),
        ("Alivaria", 0)
    ]
    
    var selectProductIndex: Int = 0{
        didSet{
            updateUIForSelectProduct()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saleTextLabel.text = " "
        updateUIForSelectProduct()
        
    }
    
    func updateUIForSelectProduct() {
        let selectProduct = products[selectProductIndex]
        productNameLabel.text = selectProduct.name
        quantityLabel.text = "\(selectProduct.quantity)"
    }
    @IBAction func increaseQuantity(_ sender: UIButton) {
        if products[selectProductIndex].quantity < 99 {
            products[selectProductIndex].quantity += 1
            updateUIForSelectProduct()
        }else {
            saleTextLabel.text = "Достигнуто макс кол-во"
        }
    }
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        if products[selectProductIndex].quantity > 0 {
            products[selectProductIndex].quantity -= 1
            updateUIForSelectProduct()
        } else {
            saleTextLabel.text = "Минимальное кол-во 0"
        }
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        saleTextLabel.text = "Продажа началась"
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        saleTextLabel.text = "Продажа остановлена"
    }
    @IBAction func sellButtonTapped(_ sender: UIButton) {
        let quantity = products[selectProductIndex].quantity
        if quantity > 0 {
            saleTextLabel.text = "Продано \(quantity) \(products[selectProductIndex].name)."
            products[selectProductIndex].quantity = 0
            updateUIForSelectProduct()
        } else {
            saleTextLabel.text = "Нет товара для продажи!"
        }
    }
    
    
    @IBAction func prevProductsButton(_ sender: UIButton) {
        if selectProductIndex > 0 {
            selectProductIndex -= 1
        }
    }
    @IBAction func nextProductsButton(_ sender: UIButton) {
        if selectProductIndex < products.count - 1  {
            selectProductIndex += 1
        }
    }
}
