//:## Custom

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()
var classifierID = ""

//:### Retrieve a list of classifiers

visualRecognition.listClassifiers(verbose: true) {
    response, error in

    guard let classifiers = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifiers)
}

//:### Create a classifier

let beagleURL = Bundle.main.url(forResource: "beagle", withExtension: "zip")
let beagle = try! Data(contentsOf: beagleURL!)
let goldenRetrieverURL = Bundle.main.url(forResource: "golden-retriever", withExtension: "zip")
let goldenRetriever = try! Data(contentsOf: goldenRetrieverURL!)
let huskyURL = Bundle.main.url(forResource: "husky", withExtension: "zip")
let husky = try! Data(contentsOf: huskyURL!)
let catsURL = Bundle.main.url(forResource: "cats", withExtension: "zip")
let cats = try! Data(contentsOf: catsURL!)

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
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    classifierID = classifier.classifierID
    print(classifier)
}

//:### Retrieve classifier details

visualRecognition.getClassifier(classifierID: classifierID) {
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifier)
}

//:### Update a classifier

let dalmatianURL = Bundle.main.url(forResource: "dalmatian", withExtension: "zip")
let dalmatian = try! Data(contentsOf: dalmatianURL!)
let moreCatsURL = Bundle.main.url(forResource: "more-cats", withExtension: "zip")
let moreCats = try! Data(contentsOf: moreCatsURL!)

visualRecognition.updateClassifier(
    classifierID: classifierID,
    positiveExamples: ["dalmatian": dalmatian],
    negativeExamples: moreCats)
{
    response, error in

    guard let classifier = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classifier)
}

//:### Delete a classifier

visualRecognition.deleteClassifier(classifierID: classifierID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("classifier deleted successfully")
}
