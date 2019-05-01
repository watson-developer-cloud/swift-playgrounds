
import NaturalLanguageClassifierV1

public func setupNaturalLanguageClassifierV1() -> NaturalLanguageClassifier {

    let apiKey = WatsonCredentials.NaturalLanguageClassifierV1APIKey

    let naturalLanguageClassifier = NaturalLanguageClassifier(apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.NaturalLanguageClassifierV1URL {
        naturalLanguageClassifier.serviceURL = serviceURL
    }

    return naturalLanguageClassifier
}

// Return a classifierID
public func getClassifierID() -> String {

    if let id = WatsonCredentials.NaturalLanguageClassifierV1ClassifierID {
        return id
    }

    let naturalLanguageClassifier = setupNaturalLanguageClassifierV1()

    var classifierID: String?
    naturalLanguageClassifier.listClassifiers() {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unknown error")
            return
        }

        classifierID = result.classifiers.first?.classifierID
        if classifierID == nil {
            let metadataURL = Bundle.main.url(forResource: "metadata", withExtension: "json")
            let metadata = try! Data(contentsOf: metadataURL!)
            let trainingDataURL = Bundle.main.url(forResource: "weather_data_train", withExtension: "csv")
            let trainingData = try! Data(contentsOf: trainingDataURL!)

            naturalLanguageClassifier.createClassifier(metadata: metadata, trainingData: trainingData) {
                response, error in

                guard let classifier = response?.result else {
                    assertionFailure(error?.localizedDescription ?? "unknown error")
                    return
                }

                classifierID = classifier.classifierID
            }
        }
    }

    while classifierID == nil { sleep(1) }
    return classifierID!
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

// Classify text

extension Classification: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ClassificationCollection: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Manage classifiers

extension ClassifierList: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Classifier: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
