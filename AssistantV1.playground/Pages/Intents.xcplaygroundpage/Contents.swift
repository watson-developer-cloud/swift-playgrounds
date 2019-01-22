//:## Intents

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

//:### List Intents

assistant.listIntents(workspaceID: workspaceID) {
    response, error in

    guard let intents = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(intents)
}

//:### Create intent

assistant.createIntent(
    workspaceID: workspaceID,
    intent: "hello",
    examples: [
        CreateExample(text: "Good morning"),
        CreateExample(text: "Hi there")
    ])
{
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(intent)
}

//:### Get intent

assistant.getIntent(workspaceID: workspaceID, intent: "hello") {
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(intent)
}

//:### Update intent

assistant.updateIntent(
    workspaceID: workspaceID,
    intent: "hello",
    newDescription: "Updated intent",
    newExamples: [CreateExample(text: "Good afternoon")])
{
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(intent)
}

//:### Delete intent

assistant.deleteIntent(workspaceID: workspaceID, intent: "hello") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("intent deleted")
}

