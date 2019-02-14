//:## Manage models

import NaturalLanguageUnderstandingV1

let naturalLanguageUnderstanding = setupNaturalLanguageUnderstandingV1()

//:### List models

naturalLanguageUnderstanding.listModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}

//:### Delete model

naturalLanguageUnderstanding.deleteModel(modelID: "model-id") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("model deleted")
}
