//:# Discovery V1

import PlaygroundSupport

//: This playground contains code examples for the Watson Assistant V1 service.

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import DiscoveryV1

//:## Authentication

let version = "2018-10-15"
let apiKey = WatsonCredentials.DiscoveryV1APIKey

let discovery = Discovery(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.DiscoveryV1URL {
    discovery.serviceURL = serviceURL
}

//:## Error handling

// TODO: Fill this in

