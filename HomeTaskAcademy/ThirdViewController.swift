class ThirdViewController: BaseViewController {
    override func nextButtonTapped() {
        let fourthVC = FourthViewController()
        fourthVC.customObject = customObject
        navigationController?.pushViewController(fourthVC, animated: true)
    }
}
