import VisualRecognitionV3

//:## Authentication

let version = "2018-10-15"
let apiKey = WatsonCredentials.VisualRecognitionV3APIKey

let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.VisualRecognitionV3URL {
    visualRecognition.serviceURL = serviceURL
}

//:## Error handling

// TODO: Fill this in

