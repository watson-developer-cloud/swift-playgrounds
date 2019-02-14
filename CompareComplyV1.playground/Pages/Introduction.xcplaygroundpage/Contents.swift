//:# Compare & Comply V1
//: This playground contains code examples for the Compare & Comply V1 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import CompareComplyV1

//:## Authentication

let version = "2018-10-15"
let apiKey = WatsonCredentials.CompareComplyV1APIKey

let compareComply = CompareComply(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.AssistantV1URL {
    assistant.serviceURL = serviceURL
}

//:## Error handlinga

// TODO: Fill this in

