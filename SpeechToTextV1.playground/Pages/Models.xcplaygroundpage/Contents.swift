//:## Models

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()

//:### List models

speechToText.listModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}

//:### Get a model

speechToText.getModel(modelID: "en-US_BroadbandModel") {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(model)
}
