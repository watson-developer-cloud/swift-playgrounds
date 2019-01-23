//:## Custom acoustic models

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var modelID: String = ""

//:### Create a custom acoustic model

speechToText.createAcousticModel(
    name: "First example acoustic model",
    baseModelName: "en-US_BroadbandModel",
    description: "First custom acoustic model example")
{
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    modelID = model.customizationID
    print(model)
}

//:### List custom acoustic models

speechToText.listAcousticModels(language: "en-US") {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}

//:### Get a custom acoustic model

speechToText.getAcousticModel(customizationID: modelID) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(model)
}

//:### Train a custom acoustic model

speechToText.trainAcousticModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Training of the custom acoustic model started successfully.")
}

//:### Reset a custom acoustic model

speechToText.resetAcousticModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom acoustic model was successfully reset.")
}

//:### Upgrade a custom acoustic model

speechToText.upgradeAcousticModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Upgrade of the custom acoustic model has started successfully.")
}

//:### Delete a custom acoustic model

speechToText.deleteAcousticModel(customizationID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom acoustic model was successfully deleted.")
}
