//:## Events and feedback

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID: String! = getEnvironmentID()
let collectionID: String! = getCollectionID(environmentID: environmentID)
let documentID: String! = getDocumentID(environmentID: environmentID, collectionID: collectionID)
let sessionToken: String! = getSessionToken(environmentID: environmentID, collectionID: collectionID)

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
formatter.date(from: "2018-01-29T14:58:39.470Z")!

//:### Create event

let eventData = EventData(environmentID: environmentID, sessionToken: sessionToken, collectionID: collectionID, documentID: documentID, /*clientTimestamp: formatter.date(from: "2018-01-29T14:58:39.470Z")!,*/ displayRank: 1)
discovery.createEvent(type: "click", data: eventData) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Search the query and event log

discovery.queryLog(query: "test", count: 5) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Number of queries over time

discovery.getMetricsQuery() {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Number of queries with an event over time

discovery.getMetricsQueryEvent() {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Number of queries with no search results over time

discovery.getMetricsQueryNoResults() {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Percentage of queries with an associated event

discovery.getMetricsEventRate() {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Most frequent query tokens with an event

discovery.getMetricsQueryTokenEvent() {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
