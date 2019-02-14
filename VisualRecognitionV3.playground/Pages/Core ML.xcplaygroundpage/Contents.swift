//:## Core ML

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()
var classifierID = WatsonCredentials.VisualRecognitionV3ClassifierID

//:### Retrieve a Core ML model of a classifier

visualRecognition.getCoreMLModel(classifierID: classifierID) {
    response, error in

    guard let coreMLData = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    let modelFile = URL(fileURLWithPath: NSTemporaryDirectory() + "\(classifierID).mlmodel")
    do {
        try coreMLData.write(to: modelFile)
        print("ML model saved to \(modelFile.lastPathComponent)")
    } catch {
        print("Error writing: \(error)")
    }
}
