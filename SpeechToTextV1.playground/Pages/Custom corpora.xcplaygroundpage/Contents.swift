//:## Custom language models

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var modelID = getModelID()

//:### List corpora

speechToText.listCorpora(customizationID: modelID) {
    response, error in

    guard let corpora = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(corpora)
}

//:### Add a corpus

let corpus1 = Bundle.main.url(forResource: "corpus1", withExtension: "txt")!
speechToText.addCorpus(customizationID: modelID, corpusName: "corpus1", corpusFile: corpus1) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Addition of the corpus data was successfully started.")
}

//:### Get a corpus

speechToText.getCorpus(customizationID: modelID, corpusName: "corpus1") {
    response, error in

    guard let corpus = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(corpus)
}

//:### Delete a corpus

speechToText.deleteCorpus(customizationID: modelID, corpusName: "corpus1") {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The corpus was successfully deleted from the custom language model.")
}
