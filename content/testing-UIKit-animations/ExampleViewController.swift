import UIKit

class ExampleViewController: UIViewController {

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white

        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(animate), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc
    func animate() {
        UIView.animateKeyframes(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.5,
                    animations: {
                        self.button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        self.button.backgroundColor = .red
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        self.button.transform = .identity
                        self.button.backgroundColor = .blue
                    }
                )
            }
        )
    }

    private let button = UIButton(frame: .zero)

}
