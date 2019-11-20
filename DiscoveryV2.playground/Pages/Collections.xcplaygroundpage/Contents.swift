//:## Collections

import DiscoveryV2

let discovery = setupDiscoveryV2()

//:### List collections

discovery.listCollections(projectID: projectID) {
    response, error in
    
    guard let collections = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(collections)
}
