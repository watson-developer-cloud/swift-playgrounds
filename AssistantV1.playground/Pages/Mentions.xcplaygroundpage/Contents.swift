//:## Mentions

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()
createSampleEntity(workspaceID: workspaceID)

//:### List entity mentions

assistant.listMentions(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    guard let mentions = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(mentions)
}

// Cleanup

deleteSampleEntity(workspaceID: workspaceID)
