//:# Visual Recognition V3
//: This playground contains code examples for the Visual Recognition V3 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import VisualRecognitionV3

//:## Authentication

let version = "2018-10-15"
let apiKey = WatsonCredentials.VisualRecognitionV3APIKey

let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.VisualRecognitionV3URL {
    visualRecognition.serviceURL = serviceURL
}

//:## Error handling

// TODO: Fill this in

