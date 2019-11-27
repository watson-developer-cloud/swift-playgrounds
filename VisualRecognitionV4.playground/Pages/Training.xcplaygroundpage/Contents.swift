//:## Training

import Foundation
import VisualRecognitionV4

let visualRecognition = setupVisualRecognitionV4()

//:### Train a collection

visualRecognition.train(collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7") { response, error in
    if let error = error {
        print(error.localizedDescription)
        return
    }
}

//:### Add training data to an image
let trainingDataJSON = """
{
  "objects": [
    {
      "object": "2018-Fit",
      "location": {
        "left": 13,
        "top": 5,
        "width": 760,
        "height": 419
      }
    }
  ]
}
""".data(using: .utf8)

let decoder = JSONDecoder()
let trainingDataObject: TrainingDataObject = try! decoder.decode(TrainingDataObject.self, from: trainingDataJSON!)


visualRecognition.addImageTrainingData(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    imageID: "2018-Honda-Fit_dc0e7bbb5169dd0337ef5b753027ca90",
    objects: [trainingDataObject]
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Get training usage

visualRecognition.getTrainingUsage(startTime: "2019-01-01", endTime: "2019-01-31") { response, error in
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(result)
}
