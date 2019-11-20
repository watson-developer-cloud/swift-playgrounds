//:# Discovery V2
//: This playground contains code examples for the Discovery V2 service.

//: Please note that Discovery V2 is only available in the Cloud Pak for Data environment.
//: To learn more about Cloud Pak for Data, go here.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import DiscoveryV2

let username = WatsonCredentials.DiscoveryV2Username
let password = WatsonCredentials.DiscoveryV2Username
let cp4dUrl = WatsonCredentials.DiscoveryV2CP4DUrl

//:## Authentication
let authenticator = WatsonCloudPakForDataAuthenticator(username: username, password: password, url: url)

let discovery = Discovery(version: "2019-11-30", authenticator: authenticator)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.DiscoveryV1URL {
    discovery.serviceURL = serviceURL
}

let projectID = "<your-project-id>"

//:## Error handling

discovery.listCollections(projectID: projectID) {
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

    guard let collections = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(collections)
}
