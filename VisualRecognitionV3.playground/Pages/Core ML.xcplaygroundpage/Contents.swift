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

    guard let coreMLData = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    let modelFile = playgroundSharedDataDirectory.appendingPathComponent(classifierID+".mlmodel")
    do {
        try coreMLData.write(to: modelFile)
        print("ML model saved to \(modelFile.lastPathComponent)")
    } catch {
        print("Error writing: \(error)")
    }
}
