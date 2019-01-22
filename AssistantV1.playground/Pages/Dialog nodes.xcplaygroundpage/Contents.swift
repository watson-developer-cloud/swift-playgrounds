//:## Dialog nodes

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

//:### List dialog nodes

assistant.listDialogNodes(workspaceID: workspaceID) {
    response, error in

    guard let dialogNodes = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(dialogNodes)
}

//:### Create dialog node

let output = DialogNodeOutput(generic: [DialogNodeOutputGeneric(responseType: "text", values: [DialogNodeOutputTextValuesElement(text: "Hi! How can I help you?")])])

assistant.createDialogNode(
    workspaceID: workspaceID,
    dialogNode: "greeting",
    conditions: "#hello",
    output: output,
    title: "Greeting")
{
    response, error in

    guard let dialogNode = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(dialogNode)
}

//:### Get dialog node

assistant.getDialogNode(workspaceID: workspaceID, dialogNode: "greeting") {
    response, error in

    guard let dialogNode = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(dialogNode)
}

//:### Update dialog node

let newOutput = DialogNodeOutput(generic: [DialogNodeOutputGeneric(responseType: "text", values: [DialogNodeOutputTextValuesElement(text: "Hello! What can I do for you?")])])

assistant.updateDialogNode(
    workspaceID: workspaceID,
    dialogNode: "greeting",
    newDialogNode: "greeting",
    newOutput: newOutput)
{
    response, error in

    guard let dialogNode = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(dialogNode)
}

//:### Delete dialog node

assistant.deleteDialogNode(workspaceID: workspaceID, dialogNode: "greeting") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("dialog node deleted")
}
