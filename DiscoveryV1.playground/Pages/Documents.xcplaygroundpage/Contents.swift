///:## Documents

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID: String! = getEnvironmentID()
let collectionID: String! = getCollectionID(environmentID: environmentID)
var documentID: String!

//:### Add a document

let sample1 = Bundle.main.url(forResource: "sample1", withExtension: "html")

discovery.addDocument(environmentID: environmentID, collectionID: collectionID, file: sample1) {
    response, error in

    guard let accepted = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    documentID = accepted.documentID
    print(accepted)
}

//:### Get document details

discovery.getDocumentStatus(environmentID: environmentID, collectionID: collectionID, documentID: documentID) {
    response, error in

    guard let status = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(status)
}

//:### Update a document

discovery.updateDocument(environmentID: environmentID, collectionID: collectionID, documentID: documentID, metadata: "{ \"Creator\": \"IBM\" }") {
    response, error in

    guard let accepted = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(accepted)
}

//:### Delete a document

discovery.deleteDocument(environmentID: environmentID, collectionID: collectionID, documentID: documentID) {
    response, error in

    guard let _ = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print("document deleted")
}
