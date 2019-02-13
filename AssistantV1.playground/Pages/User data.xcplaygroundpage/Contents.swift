//:## User data

import AssistantV1

let assistant = setupAssistantV1()
let workspaceID = getWorkspaceID()

//:### Delete labeled data

assistant.deleteUserData(customerID: "{id}") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("delete request submitted")
}
