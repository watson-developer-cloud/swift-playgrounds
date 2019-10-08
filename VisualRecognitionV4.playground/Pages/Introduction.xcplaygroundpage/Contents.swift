//:# Visual Recognition V4
//: This playground contains code examples for the Visual Recognition V3 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import VisualRecognitionV4

let apiKey = WatsonCredentials.VisualRecognitionAPIKey!

//:## Authentication

let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)

let visualRecognition = VisualRecognition(version: "2019-02-11", authenticator: authenticator)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.VisualRecognitionURL {
    visualRecognition.serviceURL = serviceURL
}

//:## Error handling

