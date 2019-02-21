
import CompareComplyV1

public func setupCompareComplyV1() -> CompareComply {

    let version = "2018-10-15"
    let apiKey = WatsonCredentials.CompareComplyV1APIKey

    let compareComply = CompareComply(version: version, apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.CompareComplyV1URL {
        compareComply.serviceURL = serviceURL
    }

    return compareComply
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

extension HTMLReturn: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension ClassifyReturn: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension TableReturn: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension CompareReturn: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension FeedbackReturn: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension FeedbackList: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension GetFeedback: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension BatchStatus: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Batches: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
