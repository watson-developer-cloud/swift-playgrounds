//:## Manage classifiers

import NaturalLanguageClassifierV1

let naturalLanguageClassifier = setupNaturalLanguageClassifierV1()
var classifierID: String = ""

//:### List classifiers

naturalLanguageClassifier.listClassifiers() {
    response, error in

    guard let classifiers = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifiers)
}

//:### Create classifier

let metadata = Bundle.main.url(forResource: "metadata", withExtension: "json")!
let trainingData = Bundle.main.url(forResource: "weather_data_train", withExtension: "csv")!

naturalLanguageClassifier.createClassifier(metadata: metadata, trainingData: trainingData) {
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    classifierID = classifier.classifierID
    print(classifier)
}

//:### Get information about a classifier

naturalLanguageClassifier.getClassifier(classifierID: classifierID) {
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifier)
}

//:### Delete classifier

naturalLanguageClassifier.deleteClassifier(classifierID: classifierID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("classifier deleted")
}
