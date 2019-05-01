import SpeechToTextV1

public func setupSpeechToTextV1() -> SpeechToText {

    let apiKey = WatsonCredentials.SpeechToTextV1APIKey

    let speechToText = SpeechToText(apiKey: apiKey)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.SpeechToTextV1URL {
        speechToText.serviceURL = serviceURL
    }

    return speechToText
}

// Return a language modelID
public func getLanguageModelID() -> String {

    let speechToText = setupSpeechToTextV1()

    var modelID: String?
    speechToText.listLanguageModels() {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unknown error")
            return
        }

        modelID = result.customizations.first?.customizationID
        if modelID == nil {
            speechToText.createLanguageModel(name: "Example language model", baseModelName: "en-US_BroadbandModel", description: "Custom language model example") {
                response, error in

                guard let model = response?.result else {
                    print(error?.localizedDescription ?? "unknown error")
                    return
                }

                modelID = model.customizationID
            }
        }
    }

    while modelID == nil { sleep(1) }
    return modelID!
}

// Return an acoustic modelID
public func getAcousticModelID() -> String {

    let speechToText = setupSpeechToTextV1()

    var modelID: String?
    speechToText.listAcousticModels() {
        response, error in

        guard let result = response?.result else {
            assertionFailure(error?.localizedDescription ?? "unknown error")
            return
        }

        modelID = result.customizations.first?.customizationID
        if modelID == nil {
            speechToText.createAcousticModel(
                name: "Example acoustic model",
                baseModelName: "en-US_BroadbandModel",
                description: "Custom acoustic model example")
            {
                response, error in

                guard let model = response?.result else {
                    print(error?.localizedDescription ?? "unknown error")
                    return
                }

                modelID = model.customizationID
            }
        }
    }

    while modelID == nil { sleep(1) }
    return modelID!
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

// Models

extension SpeechModels: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension SpeechModel: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Synchronous

extension SpeechRecognitionResults: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Asynchronous

extension RegisterStatus: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension RecognitionJob: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension RecognitionJobs: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom language models

extension LanguageModel: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension LanguageModels: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom corpora

extension Corpora: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Corpus: CustomStringConvertible {
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

extension Word: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom acoustic models

extension AcousticModel: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension AcousticModels: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom audio resources

extension AudioResources: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension AudioListing: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

// Custom grammars

extension Grammar: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}

extension Grammars: CustomStringConvertible {
    public var description: String {
        return prettyPrint(object: self) ?? "broke"
    }
}
