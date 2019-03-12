# SwiftLint config per target

![platform: iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

> EL Passion :heart: open source.

In our mission to deliver the highest quality product possible, the iOS team at EL Passion rely on linting tools such as `SwiftLint` to fix common code structuring & formatting issues.

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

We couldn't easily configure SwiftLint to use a different configuration for the production and for the test files.

## SwiftLint runner

Fortunately, we've been able to fix the issue by implementing a simple Python script which reads the contents of the `.pbxproj` file and modifies the included files in the SwiftLint config prior to the linting. The script is dived into the two simple files:

* [lint.py](https://github.com/elpassion/swiftlint-runner/blob/master/commands/lint.py),
* [xcproj.py](https://github.com/elpassion/swiftlint-runner/blob/master/commands/utils/xcproj.py).

What's even better is that we've released the script as the PyPI package, so you can use it in your own projects, too. It's as simple as running:

```
pip install swiftlint-runner
```

And adding an appropriate build phase:

```
slrunner <project_name>.xcodeproj <target_name> .<swiftlint_config_file_name>.yml
```

You can find more details at the [elpassion/swiftlint-runner](https://github.com/elpassion/swiftlint-runner) repository.

## License

**SwiftLint runner** is maintained with :heart: by EL Passion and released under an MIT license.
