//:## Entities

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()

//:### List entities

assistant.listEntities(workspaceID: workspaceID) {
    response, error in

    guard let entities = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(entities)
}

//:### Create entity

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
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(entity)
}

//:### Get entity

assistant.getEntity(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    guard let entity = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(entity)
}

//:### Update entity

assistant.updateEntity(workspaceID: workspaceID, entity: "beverage", newDescription: "Liquid refreshment"){
    response, error in

    guard let entity = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(entity)
}

//:### Delete entity

assistant.deleteEntity(workspaceID: workspaceID, entity: "beverage") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("entity deleted")
}
