//:## Voices

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()

//:### List voices

textToSpeech.listVoices() {
    response, error in

    guard let voices = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(voices)
}

//:### Get a voice

textToSpeech.getVoice(voice: "en-US_AllisonVoice") {
    response, error in

    guard let voice = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(voice)
}
