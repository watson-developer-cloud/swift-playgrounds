//:## User data

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
