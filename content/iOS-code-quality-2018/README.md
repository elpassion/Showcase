# iOS code quality metrics for 2018

![platform: iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

> Code quality metrics in iOS projects developed by EL Passion in 2018.

![Code coverage](coverage.gif)

In 2018 our iOS team successfully developed several projects with high emphasis on quality. We approached them using TDD, pair programming and regular code reviews. Here you can see the code coverage metrics based on three of the apps we implemented.

## Code coverage

> The amount of code covered by tests

|Project|Lines of code|Number of tests|Unit tests|Snapshot tests|Coverage|
|:-|-:|-:|:-:|:-:|-:|
|Fashion app|27 016|2 917|✅|✅|97.9%|
|Gym app|82 446|8 257|✅|✅|99.2%|
|AR shopping app|15 477|1 345|✅|❌|76.8%|

### Fashion app

> An app for fashion influencers that let's you browse clothes from different suppliers, mix and match them into unique
> outfits.

* Swift 4
* Tested with [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble)
* Snapshot tests with [FBSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case/)
* Continuous integration

### Gym app

> An app focused on users who are spending their time actively at the gym. Allows to interact with your favorite fitness 
> club, book gym classes, set personal goals and join public challenges. Developed in Swift 4.

* Swift 4
* Tested with [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble)
* Snapshot tests with [FBSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case/)
* Duplicated code detection with [JSCPD](https://github.com/kucherenko/jscpd)
* Continuous integration and deployment

### AR shopping app

> Application that allows you to customise furniture and preview results in augmented reality. You can then order your 
> creations from the app.

* Swift 4
* Asynchronous programming with [PromiseKit](https://github.com/mxcl/PromiseKit)
* Persistence with [Core Data](https://developer.apple.com/documentation/coredata)
* Tested with [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble)
* Continuous integration
