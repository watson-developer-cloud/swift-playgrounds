//:## User data

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()

//:### Delete labeled data

discovery.deleteUserData(customerID: "{id}") {
    response, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The delete request was successfully submitted.")
}
