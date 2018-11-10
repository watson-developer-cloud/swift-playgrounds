# Swift Playgrounds for Watson Developer Cloud Swift SDK

## Overview

This project contains Swift Playgrounds that demonstrate the commonly used features and methods of the
Watson Developer Cloud Swift SDK.

## Requirements

Swift Playgrounds are tightly bound to a version of Xcode since there is (currently) no mechanism for controlling
the Swift version or other key build settings for Playground code.

The Swift Playgrounds in this project should be used _only_ with the following versions of Xcode / Swift:

- Xcode 10.0
- Swift 4.2

## Installation

The Watson Swift Playgounds use [Carthage](https://github.com/Carthage/Carthage) to integrate the Watson Swift SDK.
You can install Carthage with [Homebrew](http://brew.sh/):

Use the following steps to install the Watson Swift SDK for use in the Watson Swift Playgrounds:

```
git clone git@github.com:mkistler/swift-playground.git
cd swift-playground
carthage update --no-build
open WatsonPlayground.xcworkspace
```

### Build the Frameworks

Before you can run code in the playground, you must build RestKit and each service framework you want to use.
To do this, select the appropriate scheme for each component in the scheme picker in Xcode and then select
Product / Build in the menu bar (or just type Cmd-B).

## Authentication

The Watson Swift Playgrounds are designed to work with Watson services that support Identity and Access Management (IAM) authentication.

### Getting credentials

You can obtain the service credentials for any Watson service instance from the IBM Cloud Dashboard:

1. Go to the IBM Cloud [Dashboard](https://console.bluemix.net/dashboard/apps?category=ai) page.
1. Either click an existing Watson service instance or click [**Create resource > AI**](https://console.bluemix.net/catalog/?category=ai) and create a service instance.
1. Click **Show** to view your service credentials.
1. Copy the `apikey` and `url`.

### Adding credentials to the project

To add the credentials for your Watson service instance(s) to the playground project:
1. Create a file named `WatsonCredentials.swift` in the `Sources` directory.
A template for this file is available in `Sources/WatsonCredentialsExample.swift`.
2. Add credentials to `WatsonCredentials.swift` for the services you plan to use in the playground.

## License

This project is licensed under Apache 2.0. Full license text is in [LICENSE][LICENSE].

[LICENSE]: https://github.com/mkistler/swift-playgrounds/blob/master/LICENSE)
