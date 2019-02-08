//:## Message

import AssistantV1

let assistant = setupAssistantV1()

//:### Get response to user input

let workspaceID = getWorkspaceID()
let input = InputData(text: "Hello")
assistant.message(workspaceID: workspaceID, input: input) {
    response, error in

    guard let message = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(message)
}
