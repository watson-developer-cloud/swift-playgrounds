//:## Synonyms

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

// Setup

assistant.createEntity(workspaceID: workspaceID, entity: "beverage",
                       values: [CreateValue(value: "water"),
                                CreateValue(value: "orange juice"),
                                CreateValue(value: "soda", synonyms: ["pop", "soft drink"])] ){
    response, error in

    guard let entity = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }
}

//:### List entity value synonyms

assistant.listSynonyms(workspaceID: workspaceID, entity: "beverage", value: "soda") {
    response, error in

    guard let synonyms = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(synonyms)
}

//:### Add entity value synonym

assistant.createSynonym(workspaceID: workspaceID, entity: "beverage", value: "orange juice", synonym: "OJ") {
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(synonym)
}

//:### Get entity value synonym

assistant.getSynonym(workspaceID: workspaceID, entity: "beverage", value: "orange juice", synonym: "OJ") {
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(synonym)
}

//:### Update entity value synonym

assistant.updateSynonym(workspaceID: workspaceID, entity: "beverage", value: "orange juice", synonym: "OJ", newSynonym: "O.J.") {
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(synonym)
}

//:### Delete entity value synonym

assistant.deleteSynonym(workspaceID: workspaceID, entity: "beverage", value: "orange juice", synonym: "O.J.") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("synonym deleted")
}

// Cleanup

assistant.deleteEntity(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }
}
