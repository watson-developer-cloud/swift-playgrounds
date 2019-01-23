//:## Custom

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()
var classifierID = ""

//:### Retrieve a list of classifiers

visualRecognition.listClassifiers(verbose: true) {
    response, error in

    guard let classifiers = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(classifiers)
}

//:### Create a classifier

let beagle = Bundle.main.url(forResource: "beagle", withExtension: "zip")!
let goldenRetriever = Bundle.main.url(forResource: "golden-retriever", withExtension: "zip")!
let husky = Bundle.main.url(forResource: "husky", withExtension: "zip")!
let cats = Bundle.main.url(forResource: "cats", withExtension: "zip")!

visualRecognition.createClassifier(
    name: "dogs",
    positiveExamples: [
        "beagle": beagle,
        "goldenretriever": goldenRetriever,
        "husky": husky
    ],
    negativeExamples: cats)
{
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    classifierID = classifier.classifierID
    print(classifier)
}

//:### Retrieve classifier details

visualRecognition.getClassifier(classifierID: classifierID) {
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(classifier)
}

//:### Update a classifier

let dalmatian = Bundle.main.url(forResource: "dalmatian", withExtension: "zip")!
let moreCats = Bundle.main.url(forResource: "more-cats", withExtension: "zip")!

visualRecognition.updateClassifier(
    classifierID: classifierID,
    positiveExamples: ["dalmatian": dalmatian],
    negativeExamples: moreCats)
{
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(classifier)
}

//:### Delete a classifier

visualRecognition.deleteClassifier(classifierID: classifierID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print("classifier deleted successfully")
}
