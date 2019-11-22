//:## Training data

import DiscoveryV2

let discovery = setupDiscoveryV2()
let documentID = "{your_document_id}"
let collectionID = "{your_collection_id}>"
var queryID: String!

//:### List training queries

discovery.listTrainingQueries(projectID: projectID) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}

//:### Delete training queries

discovery.deleteTrainingQueries(projectID: projectID) {
    _, error in
    
    if let error = error {
        debugPrint(error.localizedDescription)
        return
    }
}

//:### Create training query
let trainingExample = TrainingExample(documentID: documentID, collectionID: collectionID, relevance: 1)

discovery.createTrainingQuery(projectID: projectID, naturalLanguageQuery: "test", filter: nil, examples: [trainingExample]) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }
    
    queryID = results.queryID

    print(results)
}

//:### Get a training data query

discovery.getTrainingQuery(projectID: projectID, queryID: queryID) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}

//:### Update a training query

let trainingExample = TrainingExample(documentID: documentID, collectionID: collectionID, relevance: 1)

discovery.updateTrainingQuery(projectID: projectID, queryID: queryID, naturalLanguageQuery: "updated", examples: [trainingExample]) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}
