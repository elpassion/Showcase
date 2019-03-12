# SwiftLint config per target

![platform: iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

> Open source tooling by EL Passion.

In our mission to deliver the highest quality product possible, at the iOS team at EL Passion we rely on linting tools such as `SwiftLint` to enforce common code formatting.

However, there are some scenarios in which we can't easily employ the tooling to work for us. We've encountered this issue when developing [VinylShop mobile app](https://github.com/elpassion/VinylShop) with the following directory structure:

```
Project /
├── Project.xcodeproj
└── Sources /
    └── Controllers /
       └── Login /
           ├── LoginViewController.swift
           └── LoginViewControllerSpec.swift
```

We couldn't easily configure to use a different configuration for the production and for the test files.

## SwiftLint runner

Fortunately, we've been able to fix the issue by implementing a simple Python script which reads the contents of `.pbxproj` file and modifies the included files in the config prior to running the linting. The sources contain two files:

* [lint.py](https://github.com/elpassion/swiftlint-runner/blob/master/commands/lint.py),
* [xcproj.py](https://github.com/elpassion/swiftlint-runner/blob/master/commands/utils/xcproj.py).

What's even better, is that we've released the script as the PyPI package because we :heart: the open source software! From now on you can use it in your projects, too, by simply running:

```
pip install swiftlint-runner
```

You can find more details at the [elpassion/swiftlint-runner](https://github.com/elpassion/swiftlint-runner) repository.

## License

**SwiftLint runner** is maintained with :heart: by EL Passion and released under an MIT license.
