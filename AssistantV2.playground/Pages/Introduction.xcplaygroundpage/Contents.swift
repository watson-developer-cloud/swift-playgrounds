//:# Watson Assistant V2
//: This playground contains code examples for the Watson Assistant V2 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import AssistantV2

let apiKey = WatsonCredentials.AssistantV2APIKey

//:## Authentication

let assistant = Assistant(version: "2018-11-08", apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.AssistantV2URL {
    assistant.serviceURL = serviceURL
}

//:## Error handling

assistant.createSession(assistantID: "7777777-1111-dead-beef-ffffffffffff") {
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

    guard let session = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(session)
}
