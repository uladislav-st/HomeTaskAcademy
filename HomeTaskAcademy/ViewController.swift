import UIKit

class ViewController: UIViewController {

    var products: [Product] = [
        Product(name: "Old Bobby", quantity: 0, price: 300),
        Product(name: "Lidskae", quantity: 0, price: 450),
        Product(name: "Alivaria", quantity: 0, price: 399)
    ]
    var totalRevenue: Int = 0
    var selectedQuantities: [Int] = [0, 0, 0]
    var selectedProductIndex: Int = 0

    let productNameLabel = UILabel()
    let quantityLabel = UILabel()
    let saleTextLabel = UILabel()
    let startButton = UIButton()
    let stopButton = UIButton()
    let sellButton = UIButton()
    let increaseButton = UIButton()
    let decreaseButton = UIButton()
    let prevButton = UIButton()
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        updateUIForSelectProduct()
        updateUIForShift(isShiftActive: false)
    }

    func setupUI() {
        let screenWidth = view.frame.width
        productNameLabel.frame = CGRect(x: Constants.Layout.padding, y: 100, width: screenWidth - 2 * Constants.Layout.padding, height: Constants.Layout.labelHeight)
        productNameLabel.textAlignment = .center
        view.addSubview(productNameLabel)

        prevButton.frame = CGRect(x: Constants.Layout.padding, y: 150, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        prevButton.setTitle("<", for: .normal)
        prevButton.backgroundColor = Constants.Colors.buttonBackground
        prevButton.addTarget(self, action: #selector(prevProduct), for: .touchUpInside)
        view.addSubview(prevButton)
        
        nextButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 150, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        nextButton.setTitle(">", for: .normal)
        nextButton.backgroundColor = Constants.Colors.buttonBackground
        nextButton.addTarget(self, action: #selector(nextProduct), for: .touchUpInside)
        view.addSubview(nextButton)
 
        quantityLabel.frame = CGRect(x: Constants.Layout.padding, y: 200, width: screenWidth - 2 * Constants.Layout.padding, height: Constants.Layout.labelHeight)
        quantityLabel.textAlignment = .center
        view.addSubview(quantityLabel)
        
        increaseButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 250, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        increaseButton.setTitle("+", for: .normal)
        increaseButton.backgroundColor = Constants.Colors.buttonBackground
        increaseButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        view.addSubview(increaseButton)
        
        decreaseButton.frame = CGRect(x: Constants.Layout.padding, y: 250, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        decreaseButton.setTitle("-", for: .normal)
        decreaseButton.backgroundColor = Constants.Colors.buttonBackground
        decreaseButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        view.addSubview(decreaseButton)
        
        startButton.frame = CGRect(x: Constants.Layout.padding, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        startButton.setTitle(Constants.Texts.startButton, for: .normal)
        startButton.backgroundColor = Constants.Colors.buttonBackground
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        sellButton.frame = CGRect(x: (screenWidth - Constants.Layout.buttonWidth) / 2, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        sellButton.setTitle(Constants.Texts.sellButton, for: .normal)
        sellButton.backgroundColor = Constants.Colors.buttonBackground
        sellButton.addTarget(self, action: #selector(sellButtonTapped), for: .touchUpInside)
        view.addSubview(sellButton)
        
        stopButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
        stopButton.setTitle(Constants.Texts.stopButton, for: .normal)
        stopButton.backgroundColor = Constants.Colors.buttonBackground
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        view.addSubview(stopButton)
       
        saleTextLabel.frame = CGRect(x: Constants.Layout.padding, y: 400, width: screenWidth - 2 * Constants.Layout.padding, height: 200)
        saleTextLabel.numberOfLines = 0
        saleTextLabel.textAlignment = .center
        view.addSubview(saleTextLabel)
    }


    func updateUIForSelectProduct() {
        let product = products[selectedProductIndex]
        productNameLabel.text = product.name
        quantityLabel.text = "\(selectedQuantities[selectedProductIndex]) / \(product.quantity)"
    }

    func updateUIForShift(isShiftActive: Bool) {
        startButton.isEnabled = !isShiftActive
        stopButton.isEnabled = isShiftActive
        sellButton.isEnabled = isShiftActive
        increaseButton.isEnabled = isShiftActive
        decreaseButton.isEnabled = isShiftActive
        prevButton.isEnabled = isShiftActive
        nextButton.isEnabled = isShiftActive
    }

    @objc func increaseQuantity() {
        if selectedQuantities[selectedProductIndex] < products[selectedProductIndex].quantity {
            selectedQuantities[selectedProductIndex] += 1
            updateUIForSelectProduct()
        }
    }

    @objc func decreaseQuantity() {
        if selectedQuantities[selectedProductIndex] > 0 {
            selectedQuantities[selectedProductIndex] -= 1
            updateUIForSelectProduct()
        }
    }

    @objc func startButtonTapped() {
        for i in 0..<products.count {
            products[i].quantity = 100
            selectedQuantities[i] = 0
        }
        totalRevenue = 0
        saleTextLabel.text = Constants.Texts.shiftStarted
        updateUIForShift(isShiftActive: true)
        updateUIForSelectProduct()
    }

    @objc func sellButtonTapped() {
        saleTextLabel.text = calculateSales(products: &products, selectedQuantities: &selectedQuantities, totalRevenue: &totalRevenue)
        updateUIForSelectProduct()
    }

    @objc func stopButtonTapped() {
        saleTextLabel.text = formatSaleSummary(products: products, totalRevenue: totalRevenue)
        updateUIForShift(isShiftActive: false)
    }

    @objc func prevProduct() {
        if selectedProductIndex > 0 {
            selectedProductIndex -= 1
            updateUIForSelectProduct()
        }
    }

    @objc func nextProduct() {
        if selectedProductIndex < products.count - 1 {
            selectedProductIndex += 1
            updateUIForSelectProduct()
        }
    }
}
