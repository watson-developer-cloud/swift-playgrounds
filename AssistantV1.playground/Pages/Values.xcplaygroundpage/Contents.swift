//:## Values

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()

// Setup

createSampleEntity(workspaceID: workspaceID)

//:### List entity values

assistant.listValues(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    guard let values = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(values)
}

//:### Add entity value

assistant.createValue(workspaceID: workspaceID, entity: "beverage", value: "beer") {
    response, error in

    guard let value = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(value)
}

//:### Get entity value

assistant.getValue(workspaceID: workspaceID, entity: "beverage", value: "orange juice") {
    response, error in

    guard let value = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
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
        print(error?.localizedDescription ?? "unknown error")
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

deleteSampleEntity(workspaceID: workspaceID)
