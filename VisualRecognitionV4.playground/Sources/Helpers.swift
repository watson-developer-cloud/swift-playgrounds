import VisualRecognitionV4

public func setupVisualRecognitionV4() -> VisualRecognition {

    let version = "2019-02-11"
    let apiKey = WatsonCredentials.VisualRecognitionAPIKey!

    let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
    let visualRecognition = VisualRecognition(version: version, authenticator: authenticator)

    // Set the URL for the service endpoint if needed
    if let serviceURL = WatsonCredentials.VisualRecognitionURL {
        visualRecognition.serviceURL = serviceURL
    }

    return visualRecognition
}

public let exampleURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/220px-Giraffe_Mikumi_National_Park.jpg"
public let exampleCollectionID = "d31d6534-3458-40c4-b6de-2185a5f3cbe4"
public let exampleTrainingCollectionID = "ee7b901b-5819-43c5-afb4-99579960cec1"
