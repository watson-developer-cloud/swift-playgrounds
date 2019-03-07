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

let apiKey = WatsonCredentials.VisualRecognitionV3APIKey

//:## Authentication

let visualRecognition = VisualRecognition(version: "2018-03-19", apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.VisualRecognitionV3URL {
    visualRecognition.serviceURL = serviceURL
}

//:## Error handling

visualRecognition.listClassifiers() {
    response, error in

    if let error = error {
        switch error {
        case let .http(statusCode, message, metadata):
            switch statusCode {
            case .some(404):
                // Handle Not Found (404) exception
                print("Not found")
            case .some(413):
                // Handle Request Too Large (413) exception
                print("Payload too large")
            default:
                if let statusCode = statusCode {
                    print("Error - code: \(statusCode), \(message ?? "")")
                }
            }
        default:
            print(error.localizedDescription)
        }
        return
    }

    guard let classifiers = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifiers)
}
