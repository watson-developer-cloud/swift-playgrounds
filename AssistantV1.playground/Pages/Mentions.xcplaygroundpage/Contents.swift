//:## Mentions

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
                                CreateValue(value: "soda")] ){
    response, error in

    guard let entity = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }
}

assistant.createIntent(workspaceID: workspaceID, intent: "place_order", examples: [CreateExample(text: "Can I get a soda?")]){
    response, error in

    guard let intent = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }
}

//:### List entity mentions

assistant.listMentions(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    guard let mentions = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(mentions)
}

// Cleanup

assistant.deleteEntity(workspaceID: workspaceID, entity: "beverage") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }
}

assistant.deleteIntent(workspaceID: workspaceID, intent: "place_order") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }
}

