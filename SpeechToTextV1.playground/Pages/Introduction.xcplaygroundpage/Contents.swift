//:# Speech To Text V1
//: This playground contains code examples for the Speech To Text V1 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import SpeechToTextV1

let apiKey = WatsonCredentials.SpeechToTextV1APIKey

//:## Authentication

let speechToText = SpeechToText(apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.SpeechToTextV1URL {
    speechToText.serviceURL = serviceURL
}

//:## Error handling

speechToText.listModels() {
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

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}
