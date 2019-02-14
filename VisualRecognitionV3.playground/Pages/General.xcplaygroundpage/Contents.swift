//:## General

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()

//:### Classify an image

let fruitbowl = Bundle.main.url(forResource: "fruitbowl", withExtension: "jpg")

//: Example request with Custom models

visualRecognition.classify(imagesFile: fruitbowl, threshold: 0.6, owners: ["me"]) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(result)
}

//: Example request with the built-in Food model

visualRecognition.classify(imagesFile: fruitbowl, classifierIDs: ["food"]) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(result)
}
