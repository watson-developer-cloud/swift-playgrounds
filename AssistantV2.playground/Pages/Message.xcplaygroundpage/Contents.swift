//:## Message

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import AssistantV2

let assistant = setupAssistantV2()
var assistantID = WatsonCredentials.AssistantV2ID

// Setup

var sessionID = ""

assistant.createSession(assistantID: assistantID) {
    response, error in

    guard let session = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    sessionID = session.sessionID
    print(session)
}

//:### Message

let input = MessageInput(messageType: "text", text: "Hello")
assistant.message(assistantID: assistantID, sessionID: sessionID, input: input) {
    response, error in

    guard let message = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(message)
}

// Cleanup

assistant.deleteSession(assistantID: assistantID, sessionID: sessionID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("session deleted")
}
