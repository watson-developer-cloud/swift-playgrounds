//:## User Data

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()

//:### Delete labeled data

visualRecognition.deleteUserData(customerID: "my-customer-id") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("delete request submitted")
}
