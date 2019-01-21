import TextToSpeechV1

public func setupTextToSpeechV1() -> TextToSpeech {

    let apiKey = WatsonCredentials.TextToSpeechV1APIKey

    let textToSpeech = TextToSpeech(apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.TextToSpeechV1URL {
        textToSpeech.serviceURL = serviceURL
    }

    return textToSpeech
}

// Return a Voice Model customization ID
public func getVoiceModelID() -> String! {

    let textToSpeech = setupTextToSpeechV1()

    var modelID: String?
    textToSpeech.listVoiceModels() {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unexpected error")
            return
        }

        modelID = result.customizations.first?.customizationID
        if modelID == nil {
            textToSpeech.createVoiceModel(name: "First Model", language: "en-US", description: "First custom voice model") {
                response, error in

                guard let model = response?.result else {
                    print(error?.localizedDescription ?? "unexpected error")
                    return
                }

                modelID = model.customizationID
            }
        }
    }

    while modelID == nil { sleep(1) }
    return modelID
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

// Voices

extension Voices: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Voice: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Pronunciation

extension Pronunciation: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom models

extension VoiceModel: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension VoiceModels: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom words

extension Words: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Translation: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
