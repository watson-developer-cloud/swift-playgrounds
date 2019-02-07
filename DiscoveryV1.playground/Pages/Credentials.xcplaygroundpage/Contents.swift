//:## Credentials

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID = getEnvironmentID()
var credentialsID = ""

//:### List credentials

discovery.listCredentials(environmentID: environmentID) {
    response, error in

    guard let credentialsList = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(credentialsList)
}

//:### Create credentials

let details = CredentialDetails(
    credentialType: "username_password",
    url: "https://login.salesforce.com",
    username: "email@server.xyz",
    password: "{my_salesforce_password}{my_salesforce_security_token}")

discovery.createCredentials(
    environmentID: environmentID,
    sourceType: "salesforce",
    credentialDetails: details)
{
    response, error in

    guard let credentials = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    credentialsID = credentials.credentialID ?? ""
    print(credentials)
}

//:### View credentials

discovery.getCredentials(environmentID: environmentID, credentialID: credentialsID) {
    response, error in

    guard let credentials = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(credentials)
}

//:### Update credentials

let updatedDetails = CredentialDetails(
    credentialType: "username_password",
    url: "https://login.salesforce.com",
    username: "email@server.abc",
    password: "{my_salesforce_password}{my_salesforce_security_token}")

discovery.updateCredentials(environmentID: environmentID, credentialID: credentialsID, sourceType: "salesforce", credentialDetails: updatedDetails) {
    response, error in

    guard let credentials = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(credentials)
}

//:### Delete credentials

discovery.deleteCredentials(environmentID: environmentID, credentialID: credentialsID) {
    response, error in

    guard let _ = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print("Credentials successfully deleted.")
}
