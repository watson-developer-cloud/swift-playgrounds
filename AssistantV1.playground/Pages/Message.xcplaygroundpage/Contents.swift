//:## Message

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()

//:### Get response to user input

let workspaceID = WatsonCredentials.AssistantV1Workspace
let input = InputData(text: "Hello")
assistant.message(workspaceID: workspaceID, input: input) {
    response, error in

    guard let message = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(message)
}
