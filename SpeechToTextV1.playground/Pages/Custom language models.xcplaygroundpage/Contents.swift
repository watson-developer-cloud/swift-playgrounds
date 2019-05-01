//:## Custom language models

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var modelID: String = ""

//:### Create a custom language model

speechToText.createLanguageModel(
    name: "First example language model",
    baseModelName: "en-US_BroadbandModel",
    description: "First custom language model example")
{
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    modelID = model.customizationID
    print(model)
}

//:### List language models

speechToText.listLanguageModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}

//:### Get a custom language model

speechToText.getLanguageModel(customizationID: modelID) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(model)
}

//:### Train a custom language model

speechToText.trainLanguageModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Training of the custom language model started successfully.")
    // Poll for language model status.
}

//:### Reset a custom language model

speechToText.resetLanguageModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom language model was successfully reset.")
}

//:### Upgrade a custom language model

speechToText.upgradeLanguageModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Upgrade of the custom language model has started successfully.")
    // Poll for language model status.
}

//:### Delete a custom language model

speechToText.deleteLanguageModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom language model was successfully deleted.")
}
