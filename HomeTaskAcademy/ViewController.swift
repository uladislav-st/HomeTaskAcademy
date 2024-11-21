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
    
    // UI Элементы
    private let shopNameLabel = UILabel()
    private let productNameLabel = UILabel()
    private let quantityLabel = UILabel()
    private let saleTextLabel = UILabel()
    private let startButton = UIButton()
    private let stopButton = UIButton()
    private let sellButton = UIButton()
    private let increaseButton = UIButton()
    private let decreaseButton = UIButton()
    private let prevButton = UIButton()
    private let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .customBackground
        [sellButton, stopButton, increaseButton, decreaseButton, prevButton, nextButton].forEach {
            $0.isHidden = true
        }
        startButton.isHidden = false
        
        setupUI()
        updateUIForSelectedProduct()
        updateUIForShift(isShiftActive: false)
    }
    
    //    func setupUI() {
    //        let screenWidth = view.frame.width
    //        productNameLabel.frame = CGRect(x: Constants.Layout.padding, y: 100, width: screenWidth - 2 * Constants.Layout.padding, height: Constants.Layout.labelHeight)
    //        productNameLabel.textAlignment = .center
    //
    //        prevButton.frame = CGRect(x: Constants.Layout.padding, y: 150, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        prevButton.setTitle("<", for: .normal)
    //        prevButton.backgroundColor = Constants.Colors.buttonBackground
    //        prevButton.addTarget(self, action: #selector(prevProduct), for: .touchUpInside)
    //
    //        nextButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 150, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        nextButton.setTitle(">", for: .normal)
    //        nextButton.backgroundColor = Constants.Colors.buttonBackground
    //        nextButton.addTarget(self, action: #selector(nextProduct), for: .touchUpInside)
    //
    //        quantityLabel.frame = CGRect(x: Constants.Layout.padding, y: 200, width: screenWidth - 2 * Constants.Layout.padding, height: Constants.Layout.labelHeight)
    //        quantityLabel.textAlignment = .center
    //
    //        increaseButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 250, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        increaseButton.setTitle("+", for: .normal)
    //        increaseButton.backgroundColor = Constants.Colors.buttonBackground
    //        increaseButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
    //
    //        decreaseButton.frame = CGRect(x: Constants.Layout.padding, y: 250, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        decreaseButton.setTitle("-", for: .normal)
    //        decreaseButton.backgroundColor = Constants.Colors.buttonBackground
    //        decreaseButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
    //
    //        startButton.frame = CGRect(x: Constants.Layout.padding, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        startButton.setTitle(Constants.Texts.startButton, for: .normal)
    //        startButton.backgroundColor = Constants.Colors.buttonBackground
    //        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    //
    //        sellButton.frame = CGRect(x: (screenWidth - Constants.Layout.buttonWidth) / 2, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        sellButton.setTitle(Constants.Texts.sellButton, for: .normal)
    //        sellButton.backgroundColor = Constants.Colors.buttonBackground
    //        sellButton.addTarget(self, action: #selector(sellButtonTapped), for: .touchUpInside)
    //
    //        stopButton.frame = CGRect(x: screenWidth - Constants.Layout.buttonWidth - Constants.Layout.padding, y: 320, width: Constants.Layout.buttonWidth, height: Constants.Layout.buttonHeight)
    //        stopButton.setTitle(Constants.Texts.stopButton, for: .normal)
    //        stopButton.backgroundColor = Constants.Colors.buttonBackground
    //        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    //
    //        saleTextLabel.frame = CGRect(x: Constants.Layout.padding, y: 400, width: screenWidth - 2 * Constants.Layout.padding, height: 200)
    //        saleTextLabel.numberOfLines = 0
    //        saleTextLabel.textAlignment = .center
    //
    //        view.addSubview(productNameLabel)
    //        view.addSubview(prevButton)
    //        view.addSubview(nextButton)
    //        view.addSubview(quantityLabel)
    //        view.addSubview(increaseButton)
    //        view.addSubview(decreaseButton)
    //        view.addSubview(startButton)
    //        view.addSubview(sellButton)
    //        view.addSubview(stopButton)
    //        view.addSubview(saleTextLabel)
    //
    //    }
    
    private func setupUI() {
        configureLabel(productNameLabel, textAlignment: .center)
        configureLabel(quantityLabel, textAlignment: .center)
        configureLabel(saleTextLabel, textAlignment: .center)
        configureLabel(shopNameLabel, textAlignment: .center)
        shopNameLabel.text = "Pivnyshechka"
        shopNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        shopNameLabel.textColor = .label
        saleTextLabel.numberOfLines = 0
        
        configureButton(prevButton, title: "<", action: #selector(prevProduct), backgroundColor: .controlStack)
        configureButton(nextButton, title: ">", action: #selector(nextProduct), backgroundColor: .controlStack)
        configureButton(increaseButton, title: "+", action: #selector(increaseQuantity), backgroundColor: .controlStack)
        configureButton(decreaseButton, title: "-", action: #selector(decreaseQuantity), backgroundColor: .controlStack)
        configureButton(startButton, title: Constants.Texts.startButton, action: #selector(startButtonTapped), height: Constants.Layout.buttonHeight, width: Constants.Layout.buttonWidth)
        configureButton(sellButton, title: Constants.Texts.sellButton, action: #selector(sellButtonTapped), height: Constants.Layout.buttonHeight, width: Constants.Layout.buttonWidth)
        configureButton(stopButton, title: Constants.Texts.stopButton, action: #selector(stopButtonTapped), backgroundColor: .systemRed, height: Constants.Layout.buttonHeight, width: Constants.Layout.buttonWidth)
        
        // Размещение элементов через Auto Layout
        setupLayout()
    }
    
    private func configureLabel(_ label: UILabel, textAlignment: NSTextAlignment) {
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureButton(_ button: UIButton, title: String, action: Selector, backgroundColor: UIColor = .buttonBackground, height : CGFloat? = nil, width : CGFloat? = nil, cornerRadius : CGFloat = 10) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
              button.widthAnchor.constraint(equalToConstant: width).isActive = true
          }
        if let height = height {
              button.heightAnchor.constraint(equalToConstant: height).isActive = true
          }
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
      
    }
    
    private func setupLayout() {
        let buttonsStack = UIStackView(arrangedSubviews: [decreaseButton, increaseButton])
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = Constants.Layout.padding
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        let controlStack = UIStackView(arrangedSubviews: [prevButton, quantityLabel, nextButton])
        controlStack.axis = .horizontal
        controlStack.spacing = Constants.Layout.padding
        controlStack.translatesAutoresizingMaskIntoConstraints = false
        
        let actionStack = UIStackView(arrangedSubviews: [startButton, sellButton, stopButton])
        actionStack.axis = .horizontal
        actionStack.spacing = Constants.Layout.padding
        actionStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(productNameLabel)
        view.addSubview(controlStack)
        view.addSubview(buttonsStack)
        view.addSubview(actionStack)
        view.addSubview(saleTextLabel)
        view.addSubview(shopNameLabel)
        
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Layout.padding),
            shopNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
            productNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Layout.padding * 5),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            controlStack.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: Constants.Layout.padding * 2),
            controlStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonsStack.topAnchor.constraint(equalTo: controlStack.bottomAnchor, constant: Constants.Layout.padding * 2),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            actionStack.topAnchor.constraint(equalTo: saleTextLabel.bottomAnchor, constant: Constants.Layout.padding * 5),
            actionStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saleTextLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            saleTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Layout.padding),
            saleTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Layout.padding),
        ])
    }
    
    private func updateUIForSelectedProduct() {
        let product = products[selectedProductIndex]
        productNameLabel.text = product.name
        quantityLabel.text = "\(selectedQuantities[selectedProductIndex]) / \(product.quantity)"
    }
    
    private func updateUIForShift(isShiftActive: Bool) {
        [sellButton, stopButton, increaseButton, decreaseButton, prevButton, nextButton, quantityLabel, productNameLabel].forEach {
            $0.isHidden = !isShiftActive
        }
        startButton.isHidden = isShiftActive
    }
    
    @objc private func increaseQuantity() {
        if selectedQuantities[selectedProductIndex] < products[selectedProductIndex].quantity {
            selectedQuantities[selectedProductIndex] += 1
            updateUIForSelectedProduct()
        }
    }
    
    @objc private func decreaseQuantity() {
        if selectedQuantities[selectedProductIndex] > 0 {
            selectedQuantities[selectedProductIndex] -= 1
            updateUIForSelectedProduct()
        }
    }
    
    @objc private func startButtonTapped() {
        products = products.map { Product(name: $0.name, quantity: 100, price: $0.price) }
        totalRevenue = 0
        saleTextLabel.text = Constants.Texts.shiftStarted
        updateUIForShift(isShiftActive: true)
        updateUIForSelectedProduct()
    }
    
    @objc private func sellButtonTapped() {
        saleTextLabel.text = calculateSales(products: &products, selectedQuantities: &selectedQuantities, totalRevenue: &totalRevenue)
        updateUIForSelectedProduct()
    }
    
    @objc private func stopButtonTapped() {
        saleTextLabel.text = formatSaleSummary(products: products, totalRevenue: totalRevenue)
        [sellButton, stopButton, increaseButton, decreaseButton, prevButton, nextButton, quantityLabel, productNameLabel].forEach {
            $0.isHidden = true
        }
        startButton.isHidden = false
        updateUIForShift(isShiftActive: false)
    }
    
    @objc private func prevProduct() {
        if selectedProductIndex > 0 {
            selectedProductIndex -= 1
            updateUIForSelectedProduct()
        }
    }
    
    @objc private func nextProduct() {
        if selectedProductIndex < products.count - 1 {
            selectedProductIndex += 1
            updateUIForSelectedProduct()
        }
    }
}
