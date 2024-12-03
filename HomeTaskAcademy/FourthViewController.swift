class FourthViewController: BaseViewController {
    override func nextButtonTapped() {
        let fifthVC = FifthViewController()
        fifthVC.customObject = customObject
        navigationController?.pushViewController(fifthVC, animated: true)
    }
}
