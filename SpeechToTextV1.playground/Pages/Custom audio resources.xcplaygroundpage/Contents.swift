//:## Custom audio resources

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var customizationID = "<your-customization-ID-here>"

//:### List audio resources

speechToText.listAudio(customizationID: customizationID) {
    response, error in

    guard let resources = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(resources)
}

//:### Add an audio resource

let audio1 = Data(contentsOf: Bundle.main.url(forResource: "audio1", withExtension: "wav")!)
speechToText.addAudio(
    customizationID: customizationID,
    audioName: "audio1",
    audioResource: audio1,
    contentType: "audio/wav")
{
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Addition of the audio resource was successfully started.")
}

//:### Get an audio resource

speechToText.getAudio(customizationID: customizationID, audioName: "audio1") {
    response, error in

    guard let listing = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(listing)
}

//:### Delete an audio resource

speechToText.deleteAudio(customizationID: customizationID, audioName: "audio1") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The audio resource was successfully deleted from the custom acoustic model.")
}
