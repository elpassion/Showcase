import XCTest
import SnapshotTesting
@testable import DemoApp

class ExampleViewControllerTests: XCTestCase {

    var sut: ExampleViewController!
    var window: UIWindow!

    override func setUp() {
        sut = ExampleViewController()
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 220, height: 100))
        window.rootViewController = sut
        window.isHidden = false
    }

    override func tearDown() {
        window = nil
        sut = nil
    }

    func testAnimation() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: {
            self.sut.animate()
        })

        (0...10).map { CGFloat($0) / 10.0 }.forEach { animationProgress in
            animator.fractionComplete = animationProgress
            assertSnapshot(
                matching: window,
                as: .image(drawHierarchyInKeyWindow: true),
                named: "animation_\(String(format: "%02.0f", animationProgress * 10))"
            )
        }

        animator.pauseAnimation()
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
    }

}
