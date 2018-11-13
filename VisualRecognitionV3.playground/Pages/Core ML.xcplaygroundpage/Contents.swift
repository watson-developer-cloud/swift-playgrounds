//:## Core ML

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()
var classifierID = WatsonCredentials.VisualRecognitionV3ClassifierID

//:### Retrieve a Core ML model of a classifier

visualRecognition.getCoreMLModel(classifierID: classifierID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    let modelFile = playgroundSharedDataDirectory.appendingPathComponent(classifierID+".mlmodel")
    do {
        try result.write(to: modelFile)
        print("ML model saved to \(modelFile.lastPathComponent)")
    } catch {
        print("Error writing: \(error)")
    }
}
