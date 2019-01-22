//:## Values

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

// Setup

assistant.createEntity(
    workspaceID: workspaceID,
    entity: "beverage",
    values: [
        CreateValue(value: "water"),
        CreateValue(value: "orange juice"),
        CreateValue(value: "soda")
    ])
{
    response, error in

    guard let entity = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }
}

//:### List entity values

assistant.listValues(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    guard let values = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(values)
}

//:### Add entity value

assistant.createValue(workspaceID: workspaceID, entity: "beverage", value: "beer") {
    response, error in

    guard let value = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(value)
}

//:### Get entity value

assistant.getValue(workspaceID: workspaceID, entity: "beverage", value: "orange juice") {
    response, error in

    guard let value = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(value)
}

//:### Update entity value

assistant.updateValue(
    workspaceID: workspaceID,
    entity: "beverage",
    value: "soda",
    newSynonyms: ["pop", "soft drink"])
{
    response, error in

    guard let value = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(value)
}

//:### Delete entity value

assistant.deleteValue(workspaceID: workspaceID, entity: "beverage", value: "beer") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("value deleted")
}

// Cleanup

assistant.deleteEntity(workspaceID: workspaceID, entity: "beverage") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }
}
