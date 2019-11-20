//:## Documents

import DiscoveryV2

let discovery = setupDiscoveryV2()
var documentID: String!

//:### Add a document

let url = Bundle.main.url(forResource: "KennedySpeech", withExtension: "html")
let testDocument = try! Data(contentsOf: url!)

discovery.addDocument(projectID: projectID, collectionID: collectionID, file: testDocument, filename: "test_file", fileContentType: "application/html", xWatsonDiscoveryForce: false) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }
    
    documentID = results.documentID

    print(results)
}

//:### Update a document

discovery.updateDocument(projectID: projectID, collectionID: collectionID, documentID: documentID, file: testDocument, filename: "updated_file", fileContentType: "text/html", xWatsonDiscoveryForce: false) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}

//:### Delete a document

discovery.deleteDocument(projectID: projectID, collectionID: collectionID, documentID: documentID, xWatsonDiscoveryForce: false) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}
