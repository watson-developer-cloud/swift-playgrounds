//:## Custom words

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()
var customizationID = getVoiceModelID()

//:### Add custom words

let words = [
    Word(word: "EEE", translation: "<phoneme alphabet=\"ibm\" ph=\"tr1Ipxl.1i\"></phoneme>"),
    Word(word: "IEEE", translation: "<phoneme alphabet=\"ibm\" ph=\"1Y.tr1Ipxl.1i\"></phoneme>")
]
textToSpeech.addWords(customizationID: customizationID, words: words) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The words were successfully added to the custom voice model.")
}

//:### List custom words

textToSpeech.listWords(customizationID: customizationID) {
    response, error in

    guard let words = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(words)
}

//:### Add a custom word

textToSpeech.addWord(customizationID: customizationID, word: "ACLs", translation: "ackles") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The word was successfully added to the custom voice model.")
}

//:### Get a custom word

textToSpeech.getWord(customizationID: customizationID, word: "ACLs") {
    response, error in

    guard let word = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(word)
}

//:### Delete a custom word

textToSpeech.deleteWord(customizationID: customizationID, word: "ACLs") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The word was successfully deleted from the custom voice model.")
}
