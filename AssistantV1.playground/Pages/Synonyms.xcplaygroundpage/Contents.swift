//:## Synonyms

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()
createSampleEntity(workspaceID: workspaceID)

//:### List entity value synonyms

assistant.listSynonyms(workspaceID: workspaceID, entity: "beverage", value: "soda") {
    response, error in

    guard let synonyms = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(synonyms)
}

//:### Add entity value synonym

assistant.createSynonym(
    workspaceID: workspaceID,
    entity: "beverage",
    value: "orange juice",
    synonym: "OJ")
{
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(synonym)
}

//:### Get entity value synonym

assistant.getSynonym(
    workspaceID: workspaceID,
    entity: "beverage",
    value: "orange juice",
    synonym: "OJ")
{
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(synonym)
}

//:### Update entity value synonym

assistant.updateSynonym(
    workspaceID: workspaceID,
    entity: "beverage",
    value: "orange juice",
    synonym: "OJ",
    newSynonym: "O.J.")
{
    response, error in

    guard let synonym = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(synonym)
}

//:### Delete entity value synonym

assistant.deleteSynonym(
    workspaceID: workspaceID,
    entity: "beverage",
    value: "orange juice",
    synonym: "O.J.")
{
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("synonym deleted")
}

// Cleanup

deleteSampleEntity(workspaceID: workspaceID)
