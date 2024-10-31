import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var saleTextLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var products: [(name: String, quantity: Int, price: Int)] = [
        ("Old Bobby", 0, 300),
        ("Lidskae", 0, 450),
        ("Alivaria", 0, 399)
    ]
    
    var selectProductIndex: Int = 0{
        didSet{
            updateUIForSelectProduct()
        }
    }
    
    var totalRevenue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saleTextLabel.text = " "
        saleTextLabel.numberOfLines = 0
        saleTextLabel.lineBreakMode = .byWordWrapping
        saleTextLabel.adjustsFontSizeToFitWidth = true
        saleTextLabel.minimumScaleFactor = 0.5
        updateUIForSelectProduct()
        updateUIForShift(isShiftActive: false)
        
    }
    
    func updateUIForSelectProduct() {
        let selectProduct = products[selectProductIndex]
        productNameLabel.text = selectProduct.name
        quantityLabel.text = "\(selectProduct.quantity)"
    }
    
    func updateUIForShift(isShiftActive: Bool){
        startButton.isEnabled = !isShiftActive
        stopButton.isEnabled = isShiftActive
        sellButton.isEnabled = isShiftActive
        increaseButton.isEnabled = isShiftActive
        decreaseButton.isEnabled = isShiftActive
        prevButton.isEnabled = isShiftActive
        nextButton.isEnabled = isShiftActive
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
        for i in 0..<products.count {
            products[i].quantity = 0
        }
        totalRevenue = 0
        saleTextLabel.text = "Продажа началась"
        updateUIForSelectProduct()
        updateUIForShift(isShiftActive: true)
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        var summary = "За смену: "
        for i in products {
            let soldQuantity = 100 - i.quantity
            let revenue = soldQuantity * i.price
            summary += "\(i.name), \(soldQuantity) шт, \(revenue)p;"
        }
        summary += "Итого: \(totalRevenue)p"
        saleTextLabel.text = summary
        updateUIForShift(isShiftActive: false)
    }
    
    @IBAction func sellButtonTapped(_ sender: UIButton) {
        var summary = ""
        var totalSaleAmount = 0
        
        for i in 0..<products.count{
            let product = products[i]
            let quantityToSell = product.quantity
            
            if quantityToSell > 0 {
                let revenue = quantityToSell * product.price
                totalSaleAmount += revenue
                totalRevenue += revenue
                
                products[i].quantity = 0
                
                summary += "\(product.name), \(quantityToSell)шт, \(revenue)p"
            }
        }
        
        if summary.isEmpty {
            saleTextLabel.text = "Нет товара для продажи!"
        } else {
            summary += "Итого: \(totalSaleAmount)p"
            saleTextLabel.text = summary
        }
        
        updateUIForSelectProduct()
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
