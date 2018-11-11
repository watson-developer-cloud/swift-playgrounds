//:## Examples

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace
let intent = "hello"

// Setup

assistant.createIntent(workspaceID: workspaceID, intent: "hello", examples: [CreateExample(text: "Good afternoon"), CreateExample(text: "Hi there")]){
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(intent)
}

//:### List user input examples

assistant.listExamples(workspaceID: workspaceID, intent: intent) {
    response, error in

    guard let examples = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(examples)
}

//:### Create user input example

assistant.createExample(workspaceID: workspaceID, intent: intent, text: "Howdy!"){
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(example)
}

//:### Get user input example

assistant.getExample(workspaceID: workspaceID, intent: intent, text: "Good afternoon") {
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(example)
}

//:### Update user input example

assistant.updateExample(workspaceID: workspaceID, intent: intent, text: "Hi there", newText: "Hello there!"){
    response, error in

    guard let example = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(example)
}

//:### Delete user input example

assistant.deleteExample(workspaceID: workspaceID, intent: intent, text: "Good afternoon") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("example deleted")
}

// Cleanup

assistant.deleteIntent(workspaceID: workspaceID, intent: "hello") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }
}

