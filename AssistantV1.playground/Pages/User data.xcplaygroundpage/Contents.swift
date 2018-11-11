//:## User data

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

//:### Delete labeled data

assistant.deleteUserData(customerID: "{id}") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("delete request submitted")
}
