//:## Configurations

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID = getEnvironmentID()
var configurationID = ""

//:### Add configuration

let configFile = Bundle.main.url(forResource: "config", withExtension: "json")!
let configData = Data(contentsOf: configFile)
let conversions = JSONDecoder().decode(Configuration.self, from: configData).conversions
discovery.createConfiguration(
    environmentID: environmentID,
    name: "IBM News",
    description: "A configuration useful for ingesting IBM press releases.",
    conversions: conversions)
{
    response, error in

    guard let configuration = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    configurationID = configuration.configurationID ?? ""
    print(configuration)
}

//:### List configurations

discovery.listConfigurations(environmentID: environmentID) {
    response, error in

    guard let configurations = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(configurations)
}

//:### Get configuration details

discovery.getConfiguration(environmentID: environmentID, configurationID: configurationID) {
    response, error in

    guard let configuration = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(configuration)
}

//:### Update a configuration

discovery.updateConfiguration(
    environmentID: environmentID,
    configurationID: configurationID,
    name: "new-config")
{
    response, error in

    guard let configuration = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(configuration)
}

//:### Test configuration

let sample = Bundle.main.url(forResource: "sample1", withExtension: "html")

discovery.testConfigurationInEnvironment(
    environmentID: environmentID,
    configurationID: configurationID,
    file: sample)
{
    response, error in

    guard let testDocument = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(testDocument)
}

//:### Delete a configuration

discovery.deleteConfiguration(environmentID: environmentID, configurationID: configurationID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
