//:# Watson Assistant V2

import PlaygroundSupport

//: This playground contains code examples for the Watson Assistant V2 service.

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

import AssistantV2

//:## Authentication

let version = "2018-11-08"
let apiKey = WatsonCredentials.AssistantV2APIKey

let assistant = Assistant(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.AssistantV2URL {
    assistant.serviceURL = serviceURL
}

//:## Error handling

// TODO: Fill this in

