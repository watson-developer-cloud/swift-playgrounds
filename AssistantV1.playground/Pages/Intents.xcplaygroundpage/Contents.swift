//:## Intents

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()

//:### List Intents

assistant.listIntents(workspaceID: workspaceID) {
    response, error in

    guard let intents = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(intents)
}

//:### Create intent

assistant.createIntent(
    workspaceID: workspaceID,
    intent: "hello",
    examples: [
        Example(text: "Good morning"),
        Example(text: "Hi there")
    ])
{
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(intent)
}

//:### Get intent

assistant.getIntent(workspaceID: workspaceID, intent: "hello") {
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(intent)
}

//:### Update intent

assistant.updateIntent(
    workspaceID: workspaceID,
    intent: "hello",
    newDescription: "Updated intent",
    newExamples: [Example(text: "Good afternoon")])
{
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
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
