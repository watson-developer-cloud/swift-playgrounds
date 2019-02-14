//:## Face

import VisualRecognitionV3

let visualRecognition = setupVisualRecognitionV3()

//:### Detect faces in images

let ginni = Bundle.main.url(forResource: "Ginni_Rometty", withExtension: "jpg")!

//: Example request with Custom models

visualRecognition.detectFaces(imagesFile: ginni) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(result)
}

