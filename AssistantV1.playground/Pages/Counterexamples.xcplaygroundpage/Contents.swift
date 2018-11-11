//:## Counterxamples

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = WatsonCredentials.AssistantV1Workspace

//:### List counterexamples

assistant.listCounterexamples(workspaceID: workspaceID) {
    response, error in

    guard let counterexamples = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(counterexamples)
}

//:### Create counterexample

assistant.createCounterexample(workspaceID: workspaceID, text: "Make me a sandwich") {
    response, error in

    guard let counterexample = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(counterexample)
}

//:### Get counterexample

assistant.getCounterexample(workspaceID: workspaceID, text: "Make me a sandwich") {
    response, error in

    guard let counterexample = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(counterexample)
}

//:### Update counterexample

assistant.updateCounterexample(workspaceID: workspaceID, text: "Make me a sandwich", newText: "Make me a cheeseburger"){
    response, error in

    guard let counterexample = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(counterexample)
}

//:### Delete counterexample

assistant.deleteCounterexample(workspaceID: workspaceID, text: "Make me a cheeseburger") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("counterexample deleted")
}
