//:## Queries

import DiscoveryV2

let discovery = setupDiscoveryV2()

//:### Query a project

discovery.query(projectID: projectID) {
    response, error in
    
    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}

//:### Get Autocomplete Suggestions

discovery.getAutocompletion(projectID: projectID, collectionIDs: [collectionID], prefix: "tes") {
    response, error in
    
    guard let suggestions = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(suggestions)
}

//:### Query system notices

discovery.queryNotices(projectID: projectID, naturalLanguageQuery: "warning") {
    response, error in
    
    guard let notices = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(notices)
}

//:### List fields

discovery.listFields(projectID: projectID) {
    response, error in

    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(notices)
}
