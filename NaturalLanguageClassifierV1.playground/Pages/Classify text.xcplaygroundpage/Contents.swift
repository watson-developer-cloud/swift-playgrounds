//:## Classify text

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import NaturalLanguageClassifierV1

let naturalLanguageClassifier = setupNaturalLanguageClassifierV1()
let classifierID = getClassifierID()!

//:### Classify a phrase

naturalLanguageClassifier.classify(classifierID: classifierID, text: "How hot will it be today?") {
    response, error in

    guard let translation = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(translation)
}
