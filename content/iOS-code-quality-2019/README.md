# iOS code quality metrics for 2019

![platform: iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

> Code quality metrics in iOS projects developed by EL Passion in 2019.

In 2019 our iOS team has successfully developed several projects with varied tech stacks. However, the common part is that we approached them all using TDD, pair programming and regular code reviews. Here you can see the code coverage metrics.

## Code coverage

> The amount of code covered by tests

|Project|Lines of code|Number of tests|Unit tests|Snapshot tests|Coverage|
|:-|-:|-:|:-:|:-:|-:|
|Mindfulness app|16 039|1 026|✅|✅|85.90%|
|Banking app|29 871|3 355|✅|✅|97.68%|
|Shared networking library|5 183|800|✅|❌|97.88%|

### Mindfulness app

> The mindfulness app with materials aiding cancer treatment. 

* Swift 5
* Tested with [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble)
* Snapshot tests with [iOSSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case)
* Continuous integration

### Banking app

> The banking app for fast online payments with instant in-app events based on live backend communication. 
> The app featured a lot of complex navigation flows.
> The security and the UI component integrity between platforms were the critical parts.

* Swift 5
* Tested with [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble)
* Snapshot tests with [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing)
* Continuous integration
* Continuous deployment

### Shared networking library

> The shared library performing the network communication for Android & iOS apps implemented in C++14.
> The library is shipped as a native Android library using NDK and an iOS framework using Objective-C++.
> The native platform bridging code was generated using Djinni.
> The security of the data transmission and code obfuscation were the critical parts.

* C++14
* Unit-tested with [googletest](https://github.com/google/googletest)
* Bridged to native platforms with [djinni](https://github.com/dropbox/djinni)
* Networking with [libcurl](https://curl.haxx.se/libcurl/)
* Encryption with [OpenSSL](https://www.openssl.org/)
* Continuous integration
* Automated deployment procedures 

