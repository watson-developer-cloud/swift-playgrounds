//:# Personality Insights V3
//: This playground contains code examples for the Personality Insights V3 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import PersonalityInsightsV3

//:## Authentication

let apiKey = WatsonCredentials.PersonalityInsightsV3APIKey
let personalityInsights = PersonalityInsights(version: "2017-10-13", apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.PersonalityInsightsV3URL {
    personalityInsights.serviceURL = serviceURL
}

//:## Error handling

let url = Bundle.main.url(forResource: "profile", withExtension: "json")!
let content = try JSONDecoder().decode(Content.self, from: Data(contentsOf: url))

personalityInsights.profile(profileContent: ProfileContent.content(content)) {
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

    guard let profile = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(profile)
}
