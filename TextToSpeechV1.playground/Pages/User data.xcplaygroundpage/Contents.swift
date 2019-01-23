//:## User data

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()

//:### Delete labeled data

textToSpeech.deleteUserData(customerID: "{my_customer_ID}") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The deletion request was successfully submitted.")
}
