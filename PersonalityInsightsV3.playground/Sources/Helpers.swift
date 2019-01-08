import PersonalityInsightsV3

public func setupPersonalityInsightsV3() -> PersonalityInsights {

    let version = "2018-10-15"
    let apiKey = WatsonCredentials.PersonalityInsightsV3APIKey

    let personalityInsights = PersonalityInsights(version: version, apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.PersonalityInsightsV3URL {
        personalityInsights.serviceURL = serviceURL
    }

    return personalityInsights
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

// Get profile

extension Profile: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}


