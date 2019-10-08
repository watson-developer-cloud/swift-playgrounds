//:## Collections

import Foundation
import VisualRecognitionV4

let visualRecognition = setupVisualRecognitionV4()

//:### Create a collection

visualRecognition.createCollection(
    name: "my-collection",
    description: "A description of my collection"
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### List collections

visualRecognition.listCollections() { response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Get collection details

visualRecognition.getCollection(collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7") { response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Update a collection

visualRecognition.updateCollection(
    collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7",
    description: "Updated description of my collection"
) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Delete a collection

visualRecognition.deleteCollection(collectionID: "5826c5ec-6f86-44b1-ab2b-cca6c75f2fc7") { response, error in
    
    if let error = error {
        print(error.localizedDescription)
        return
    }
}
