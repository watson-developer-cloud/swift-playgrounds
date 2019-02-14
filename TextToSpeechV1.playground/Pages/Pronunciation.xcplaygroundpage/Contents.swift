//:## Pronunciation

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()

//:### Get pronunciation

textToSpeech.getPronunciation(text: "IEEE", voice: "en-US_AllisonVoice", format: "ibm") {
    response, error in

    guard let pronunciation = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(pronunciation)
}
