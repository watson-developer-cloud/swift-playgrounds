//:## User data

import VisualRecognitionV4

let visualRecognition = setupVisualRecognitionV4()

//:### Delete labeled data

visualRecognition.deleteUserData(customerID: "{customer-id}") { response, error in
    if let error = error {
        print(error.localizedDescription)
        return
    }
}
