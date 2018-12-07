//:## Configurations

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID: String! = getEnvironmentID()
var configurationID: String!

//:### Add configuration

let conversions = Conversions(
    html: HTMLSettings(excludeTagsKeepContent: ["span"], excludeContent: XPathPatterns(xpaths: ["/home"])),
    segment: SegmentSettings(enabled: true, selectorTags: ["h1","h2"]),
    jsonNormalizations: [
        NormalizationOperation(operation: "move", sourceField: "extracted_metadata.title", destinationField: "metadata.title"),
        NormalizationOperation(operation: "move", sourceField: "extracted_metadata.author", destinationField: "metadata.author"),
        NormalizationOperation(operation: "remove", sourceField: "extracted_metadata")])
discovery.createConfiguration(environmentID: environmentID, name: "IBM News", description: "A configuration useful for ingesting IBM press releases.", conversions: conversions) {
    response, error in

    guard let configuration = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    configurationID = configuration.configurationID
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

discovery.updateConfiguration(environmentID: environmentID, configurationID: configurationID, name: "new-config") {
    response, error in

    guard let configuration = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(configuration)
}

//:### Test configuration

let sample = Bundle.main.url(forResource: "sample1", withExtension: "html")

discovery.testConfigurationInEnvironment(environmentID: environmentID, configurationID: configurationID, file: sample) {
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
