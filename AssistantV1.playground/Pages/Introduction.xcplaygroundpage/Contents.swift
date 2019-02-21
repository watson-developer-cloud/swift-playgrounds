//:# Watson Assistant V1
//: This playground contains code examples for the Watson Assistant V1 service.

//: To use the Watson Developer Cloud Swift SDK in your application, specify it in your `Cartfile`:
//:```
//:github "watson-developer-cloud/swift-sdk"
//:```

//:Then run the following command to build the dependencies and frameworks:
//:```bash
//:carthage update --platform iOS
//:```

import AssistantV1

//:## Authentication

let apiKey = WatsonCredentials.AssistantV1APIKey
let assistant = Assistant(version: "2018-09-20", apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.AssistantV1URL {
    assistant.serviceURL = serviceURL
}

//:## Error handling

assistant.getWorkspace(workspaceID: getWorkspaceID()) {
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

    guard let workspace = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(workspace)
}

//:### Pagination

let workspaceID = getWorkspaceID()
func logsHandler(response: WatsonResponse<LogCollection>?, error: Error?) {
    guard let logs = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(logs)

    if let cursor = logs.pagination.nextCursor {
        assistant.listLogs(workspaceID: workspaceID, cursor: cursor, completionHandler: logsHandler)
    }
}
assistant.listLogs(workspaceID: workspaceID, completionHandler: logsHandler)
