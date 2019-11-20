//:## Queries

import DiscoveryV2

let discovery = setupDiscoveryV2()

//:### Configuration settings for components.

discovery.getComponentSettings(projectID: projectID) {
    response, error in
    
    guard let settings = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(results)
}
