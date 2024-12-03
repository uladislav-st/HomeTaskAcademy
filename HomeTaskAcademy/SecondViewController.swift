class SecondViewController: BaseViewController {
    override func nextButtonTapped() {
        let thirdVC = ThirdViewController()
        thirdVC.customObject = customObject
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}
