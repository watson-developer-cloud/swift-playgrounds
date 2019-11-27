//:## Analysis

import Foundation
import VisualRecognitionV4

let visualRecognition = setupVisualRecognitionV4()

//:### Analyze images

let hondaFileURL = Bundle.main.url(forResource: "honda", withExtension: "jpg")
let hondaImageData = try? Data(contentsOf: hondaFileURL!)
let hondaImageFile = FileWithMetadata(data: hondaImageData!, filename: "honda.jpg", contentType: "image/jpg")

let diceFileURL = Bundle.main.url(forResource: "honda", withExtension: "jpg")
let diceImageData = try? Data(contentsOf: diceFileURL!)
let diceImageFile = FileWithMetadata(data: hondaImageData!, filename: "honda.jpg", contentType: "image/jpg")

visualRecognition.analyze(
    collectionIDs: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    features: ["objects"],
    imagesFile: [hondaImageFile, diceImageFile]
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}
