///:## Queries

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID: String! = "system"  // Built-in news environment
let collectionID: String! = "news-en"  // Built-in news collection

//:### Query your collection

// query=relations.action.lemmatized:acquire&count=15&filter=entities.text:IBM&return=text"

discovery.query(environmentID: environmentID, collectionID: collectionID, query: "enriched_text.concepts.text:Cloud computing") {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Query system notices

environmentID =  getEnvironmentID()
collectionID = getCollectionID(environmentID: environmentID)

discovery.queryNotices(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
