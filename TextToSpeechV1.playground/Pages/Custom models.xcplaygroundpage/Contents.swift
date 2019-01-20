//:## Custom models

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()
var customizationID: String!

//:### Create a custom model

textToSpeech.createVoiceModel(name: "First Model", language: "en-US", description: "First custom voice model") {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    customizationID = model.customizationID
    print(model)
}

//:### List custom models

textToSpeech.listVoiceModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(models)
}

//:### Update a custom model

let words = [ Word(word: "NCAA", translation: "N C double A"),
              Word(word: "iPhone", translation: "I phone")]
textToSpeech.updateVoiceModel(customizationID: customizationID, name: "First Model Update", description: "First custom voice model update", words: words) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom voice model was successfully updated.")
}

//:### Get a custom model

textToSpeech.getVoiceModel(customizationID: customizationID) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    customizationID = model.customizationID
    print(model)
}

//:### Delete a custom model

textToSpeech.deleteVoiceModel(customizationID: customizationID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom voice model was successfully deleted.")
}
