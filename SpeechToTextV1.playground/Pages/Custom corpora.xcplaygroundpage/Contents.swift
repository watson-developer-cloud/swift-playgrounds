//:## Custom corpora

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var modelID = getLanguageModelID()

//:### List corpora

speechToText.listCorpora(customizationID: modelID) {
    response, error in

    guard let corpora = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(corpora)
}

//:### Add a corpus

let url = Bundle.main.url(forResource: "corpus1", withExtension: "txt")
let corpus1 = try! Data(contentsOf: url!)
speechToText.addCorpus(customizationID: modelID, corpusName: "corpus1", corpusFile: corpus1) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Addition of the corpus data was successfully started.")
    // Poll for corpus status.
}

//:### Get a corpus

speechToText.getCorpus(customizationID: modelID, corpusName: "corpus1") {
    response, error in

    guard let corpus = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
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
