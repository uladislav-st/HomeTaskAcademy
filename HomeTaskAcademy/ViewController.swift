import UIKit
import SnapKit

class ViewController: UIViewController {

    private let sideMenuWidth: CGFloat = 250
    private var isMenuOpen = false

    private lazy var sideMenu: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()

    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var burgerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("☰", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(dimmingView)
        view.addSubview(sideMenu)
        view.addSubview(burgerButton)

        sideMenu.addSubview(loginButton)
        setupConstraints()
    }

    private func setupConstraints() {
        sideMenu.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(sideMenuWidth)
            make.leading.equalToSuperview().offset(-sideMenuWidth)
        }

        dimmingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        burgerButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalToSuperview().offset(-16) 
            make.width.height.equalTo(50)
        }

        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalToSuperview().offset(50)
        }
    }

    @objc private func toggleMenu() {
        isMenuOpen.toggle()

        sideMenu.snp.updateConstraints { make in
            make.leading.equalToSuperview().offset(isMenuOpen ? 0 : -sideMenuWidth)
        }

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.dimmingView.alpha = self.isMenuOpen ? 1 : 0
        }
    }

    @objc private func dimmingViewTapped() {
        if isMenuOpen {
            toggleMenu()
        }
    }

    @objc private func loginButtonTapped() {
        let alertController = UIAlertController(title: "Вход", message: "Введите пароль", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Пароль"
            textField.isSecureTextEntry = true
        }
        
        let loginAction = UIAlertAction(title: "Войти", style: .default) { _ in
            if let password = alertController.textFields?.first?.text {
                print("Введённый пароль: \(password)")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(loginAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
