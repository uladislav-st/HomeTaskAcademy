
class FirstViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        customObject = CustomObject(name: "John Doe", age: 30)
    }

    override func nextButtonTapped() {
        let secondVC = SecondViewController()
        secondVC.customObject = customObject
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
