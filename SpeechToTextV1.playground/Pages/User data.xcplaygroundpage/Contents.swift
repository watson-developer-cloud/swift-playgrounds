//:## User data

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()

//:### Delete labeled data

speechToText.deleteUserData(customerID: "{my_customer_ID}") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The deletion request was successfully submitted.")
}
