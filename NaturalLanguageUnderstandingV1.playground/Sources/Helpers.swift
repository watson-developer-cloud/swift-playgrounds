import NaturalLanguageUnderstandingV1

public func setupNaturalLanguageUnderstandingV1() -> NaturalLanguageUnderstanding {

    let version = "2018-10-15"
    let apiKey = WatsonCredentials.NaturalLanguageUnderstandingV1APIKey

    let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(version: version, apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.NaturalLanguageUnderstandingV1URL {
        naturalLanguageUnderstanding.serviceURL = serviceURL
    }

    return naturalLanguageUnderstanding
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

// Analyze text

extension AnalysisResults: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Manage models

extension ListModelsResults: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
