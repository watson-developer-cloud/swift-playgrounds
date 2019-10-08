//:## Images

import Foundation
import VisualRecognitionV4

let visualRecognition = setupVisualRecognitionV4()

//:### Add images

let trainingDataJSON = """
{
  "objects": [
    {
      "object": "2018-Fit",
      "location": {
        "left": 33,
        "top": 8,
        "width": 760,
        "height": 419
      }
    }
  ]
}
"""

visualRecognition.addImages(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    imageURL: ["https://watson-developer-cloud.github.io/doc-tutorial-downloads/visual-recognition/2018-Honda-Fit.jpg"],
    trainingData: trainingDataJSON
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### List images

visualRecognition.listImages(collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7") { response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Get image details

visualRecognition.getImageDetails(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    imageID: "2018-Honda-Fit_dc0e7bbb5169dd0337ef5b753027ca90"
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Delete an image

visualRecognition.deleteImage(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    imageID: "2018-Honda-Fit_dc0e7bbb5169dd0337ef5b753027ca90"
) {
    response, error in
    
    if let error = error {
        print(error.localizedDescription)
        return
    }
}

//:### Get a JPEG file of an image

visualRecognition.getJpegImage(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    imageID: "2018-Honda-Fit_dc0e7bbb5169dd0337ef5b753027ca90"
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}
