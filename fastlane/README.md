fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Mac

### mac release

```sh
[bundle exec] fastlane mac release
```

Push a new release build to the App Store

### mac beta

```sh
[bundle exec] fastlane mac beta
```

Push a new release build to TestFlight

----


## iOS

### ios release

```sh
[bundle exec] fastlane ios release
```

Push a new release build to the App Store

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Push a new release build to TestFlight

----


## Android

### android release

```sh
[bundle exec] fastlane android release
```

Publish to GooglePlay

### android beta

```sh
[bundle exec] fastlane android beta
```

Publish to GooglePlay Beta

### android alpha

```sh
[bundle exec] fastlane android alpha
```

Publish to GooglePlay Alpha

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
