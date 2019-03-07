//:# Natural Language Classifier V1
//: This playground contains code examples for the Natural Language Classifier V1 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import NaturalLanguageClassifierV1

let apiKey = WatsonCredentials.NaturalLanguageClassifierV1APIKey

//:## Authentication

let naturalLanguageClassifier = NaturalLanguageClassifier(apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.NaturalLanguageClassifierV1URL {
    naturalLanguageClassifier.serviceURL = serviceURL
}

//:## Error handling

naturalLanguageClassifier.listClassifiers() {
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
