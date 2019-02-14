//:## Classify text

import NaturalLanguageClassifierV1

let naturalLanguageClassifier = setupNaturalLanguageClassifierV1()
let classifierID = getClassifierID()

//:### Classify a phrase

naturalLanguageClassifier.classify(classifierID: classifierID, text: "How hot will it be today?") {
    response, error in

    guard let classification = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classification)
}

//:### Classify multiple phrases

naturalLanguageClassifier.classifyCollection(
    classifierID: classifierID,
    collection: [
        ClassifyInput(text: "How hot will it be today?"),
        ClassifyInput(text: "Is it hot outside?")
    ])
{
    response, error in

    guard let classifications = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifications)
}
