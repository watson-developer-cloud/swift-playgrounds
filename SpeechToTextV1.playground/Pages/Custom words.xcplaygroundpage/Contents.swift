//:## Custom words

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var modelID = getModelID()

//:### List custom words

speechToText.listWords(customizationID: modelID, sort: "+alphabetical") {
    response, error in

    guard let words = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(words)
}

//:### Add custom words

let words = [
    CustomWord(word: "HHonors", soundsLike: ["hilton honors", "H. honors"], displayAs: "HHonors"),
    CustomWord(word: "IEEE", soundsLike: ["I. triple E."])
]
speechToText.addWords(customizationID: modelID, words: words) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Addition of the custom words was successfully started.")
}

//:### Add custom word

speechToText.addWord(
    customizationID: modelID,
    wordName: "NCAA",
    soundsLike: ["N. C. A. A.", "N. C. double A."],
    displayAs: "NCAA")
{
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom word was successfully added to the custom language model.")
}

//:### Get a custom word

speechToText.getWord(customizationID: modelID, wordName: "NCAA") {
    response, error in

    guard let word = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(word)

}

//:### Delete a custom word

speechToText.deleteWord(customizationID: modelID, wordName: "NCAA") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The custom word was successfully deleted from the custom language model.")
}
