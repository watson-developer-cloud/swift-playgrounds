//:## Collections

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID = getEnvironmentID()
let configurationID = getConfigurationID(environmentID: environmentID)
var collectionID = ""

//:### Create a collection

discovery.createCollection(
    environmentID: environmentID,
    name: "test_collection",
    description: "My test collection",
    configurationID: configurationID,
    language: "en")
{
    response, error in

    guard let collection = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    collectionID = collection.collectionID ?? ""
    print(collection)
}

//:### List collections

discovery.listCollections(environmentID: environmentID){
    response, error in

    guard let collections = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(collections)
}

//:### Get collection details

discovery.getCollection(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let collection = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(collection)
}

//:### Update a collection

discovery.updateCollection(
    environmentID: environmentID,
    collectionID: collectionID,
    name: "test_collection",
    description: "My updated test collection")
{
    response, error in

    guard let collection = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(collection)
}

//:### List collection fields

discovery.listCollectionFields(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let collectionFields = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(collectionFields)
}

//:### List fields across collections

discovery.listFields(environmentID: environmentID, collectionIDs: [collectionID]) {
    response, error in

    guard let fields = response?.result?.fields else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(fields)
}

//:### Delete a collection

discovery.deleteCollection(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
