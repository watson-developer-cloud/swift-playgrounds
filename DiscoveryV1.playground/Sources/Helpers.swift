
// If you get a build error on the import statement below, comment out all lines of this file (Cmd-A, Cmd-/)
// and then build the framework. Then uncomment all lines again and the error should be resolved.
import DiscoveryV1

public func setupDiscoveryV1() -> Discovery {

    let version = "2018-10-15"
    let apiKey = WatsonCredentials.DiscoveryV1APIKey

    let discovery = Discovery(version: version, apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.DiscoveryV1URL {
        discovery.serviceURL = serviceURL
    }

    return discovery
}

// Find or create a readWrite environment
public func getEnvironmentID() -> String {

    let discovery = setupDiscoveryV1()

    var environmentID: String?
    discovery.listEnvironments() {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        environmentID = result.environments?.first { e in !(e.readOnly ?? true) }?.environmentID
        if environmentID == nil {
            discovery.createEnvironment(name: "my_environment", description: "My environment") {
                response, error in

                guard let environment = response?.result else {
                    assertionFailure(error?.localizedDescription ?? "unexpected error")
                    return
                }

                environmentID = environment.environmentID
            }
        }
    }

    while environmentID == nil { sleep(1) }
    return environmentID!
}

// Find or create a configuration named "my_config"
public func getConfigurationID(environmentID: String) -> String {

    let discovery = setupDiscoveryV1()

    var configurationID: String?
    discovery.listConfigurations(environmentID: environmentID) {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        configurationID = result.configurations?.first?.configurationID
        if configurationID == nil {
            discovery.createConfiguration(environmentID: environmentID, name: "my_config", description: "my_config") {
                response, error in

                guard let configuration = response?.result else {
                    assertionFailure(error?.localizedDescription ?? "unexpected error")
                    return
                }

                configurationID = configuration.configurationID
            }
        }
    }

    while configurationID == nil { sleep(1) }
    return configurationID!
}

// Find or create a collection named "my_collection"
public func getCollectionID(environmentID: String) -> String {

    let discovery = setupDiscoveryV1()

    var collectionID: String?
    discovery.listCollections(environmentID: environmentID) {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        collectionID = result.collections?.first { c in c.name == "my_collection" }?.collectionID
        if collectionID == nil {
            discovery.createCollection(environmentID: environmentID, name: "my_collection") {
                response, error in

                guard let collection = response?.result else {
                    assertionFailure(error?.localizedDescription ?? "unexpected error")
                    return
                }

                collectionID = collection.collectionID
            }
        }
    }

    while collectionID == nil { sleep(1) }
    return collectionID!
}

// Find or create a document in the specified collection
public func getDocumentID(environmentID: String, collectionID: String) -> String {

    let discovery = setupDiscoveryV1()

    var documentID: String?
    discovery.query(environmentID: environmentID, collectionID: collectionID) {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        documentID = result.results?.first?.id
        if documentID == nil {
            let url = Bundle.main.url(forResource: "sample1", withExtension: "html")
            let sample1 = try! Data(contentsOf: url!)

            discovery.addDocument(environmentID: environmentID, collectionID: collectionID, file: sample1) {
                response, error in

                guard let accepted = response?.result else {
                    print(error?.localizedDescription ?? "unexpected error")
                    return
                }

                documentID = accepted.documentID
            }
        }
    }

    while documentID == nil { sleep(1) }
    return documentID!
}

public func getSessionToken(environmentID: String, collectionID: String) -> String {

    let discovery = setupDiscoveryV1()

    var sessionToken: String?
    discovery.query(environmentID: environmentID, collectionID: collectionID) {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        sessionToken = result.sessionToken
    }

    while sessionToken == nil { sleep(1) }
    return sessionToken!
}

public var encoder: JSONEncoder {
    let encoder = JSONEncoder()
    do {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        encoder.dateEncodingStrategy = .formatted(formatter)
    }
    encoder.outputFormatting = .prettyPrinted
    return encoder
}

func prettyPrint<T : Encodable>(object: T) -> String? {
    do {
        let data = try encoder.encode(object)
        return String(data: data, encoding: .utf8)
    } catch _ {
        return nil
    }
}

// Environments

extension Environment: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ListEnvironmentsResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension DeleteEnvironmentResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Configurations

extension Configuration: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension DeleteConfigurationResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ListConfigurationsResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TestDocument: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Collections

extension DiscoveryV1.Collection: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ListCollectionsResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ListCollectionFieldsResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension DeleteCollectionResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Expansions

extension Expansions: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TokenDictStatusResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Documents

extension DocumentAccepted: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension DocumentStatus: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Queries

extension QueryResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension QueryNoticesResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Training data

extension TrainingDataSet: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TrainingQuery: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TrainingExampleList: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TrainingExample: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Events and feedback

extension CreateEventResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension LogQueryResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension MetricResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension MetricTokenResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Credentials

extension Credentials: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension CredentialsList: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Gateways

extension Gateway: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension GatewayList: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension GatewayDelete: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
