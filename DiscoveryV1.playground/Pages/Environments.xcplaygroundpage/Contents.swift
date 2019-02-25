//:## Environments

import DiscoveryV1

let discovery = setupDiscoveryV1()
var environmentID = ""

//:### List environments

discovery.listEnvironments() {
    response, error in

    guard let environments = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(environments)
}

//:### Create an environment

discovery.createEnvironment(name: "my_environment", description: "My environment") {
    response, error in

    guard let environment = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    environmentID = environment.environmentID
    print(environment)
}

//:### Get environment info

discovery.getEnvironment(environmentID: environmentID) {
    response, error in

    guard let environment = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(environment)
}

//:### Update an environment

discovery.updateEnvironment(
    environmentID: environmentID,
    name: "Updated name",
    description: "Updated description")
{
    response, error in

    guard let environment = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(environment)
}

//:### Delete environment

discovery.deleteEnvironment(environmentID: environmentID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### List fields across collections

let collectionID = getCollectionID(environmentID: environmentID)

discovery.listFields(environmentID: environmentID, collectionIDs: [collectionID]) {
    response, error in

    guard let fields = response?.result?.fields else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(fields)
}
