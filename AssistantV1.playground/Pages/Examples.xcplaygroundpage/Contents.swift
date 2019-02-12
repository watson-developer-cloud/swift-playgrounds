//:## Examples

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()

// Setup
let intent = "hello"
createSampleIntent(workspaceID: workspaceID)

//:### List user input examples

assistant.listExamples(workspaceID: workspaceID, intent: intent) {
    response, error in

    guard let examples = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(examples)
}

//:### Create user input example

assistant.createExample(workspaceID: workspaceID, intent: intent, text: "Howdy!"){
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(example)
}

//:### Get user input example

assistant.getExample(workspaceID: workspaceID, intent: intent, text: "Good afternoon") {
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(example)
}

//:### Update user input example

assistant.updateExample(workspaceID: workspaceID, intent: intent, text: "Hi there", newText: "Hello there!"){
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(example)
}

//:### Delete user input example

assistant.deleteExample(workspaceID: workspaceID, intent: intent, text: "Good afternoon") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("example deleted")
}

// Cleanup

deleteSampleIntent(workspaceID: workspaceID)
