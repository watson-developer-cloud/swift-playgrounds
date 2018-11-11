
import AssistantV1

public func setupAssistantV1() -> Assistant {

    let version = "2018-10-15"
    let apiKey = WatsonCredentials.AssistantV1APIKey

    let assistant = Assistant(version: version, apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.AssistantV1URL {
        assistant.serviceURL = serviceURL
    }

    return assistant
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

extension MessageResponse: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Workspaces

extension WorkspaceCollection: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Workspace: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension WorkspaceExport: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Intents

extension IntentCollection: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Intent: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension IntentExport: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Examples

extension ExampleCollection: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Example: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

