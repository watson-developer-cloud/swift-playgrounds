//:## User data

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()

//:### Delete labeled data

speechToText.deleteUserData(customerID: "{id}") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The deletion request was successfully submitted.")
}
