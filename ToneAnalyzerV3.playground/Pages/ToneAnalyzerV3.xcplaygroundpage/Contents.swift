import ToneAnalyzerV3

//:## Authentication

let version = "2018-10-15"
let apiKey = WatsonCredentials.ToneAnalyzerV3APIKey

let toneAnalyzer = ToneAnalyzer(version: version, apiKey: apiKey)

//:## Service URL

// Set the URL for the service endpoint if needed
if let serviceURL = WatsonCredentials.ToneAnalyzerV3URL {
    toneAnalyzer.serviceURL = serviceURL
}

//:## Error handling

// TODO: Fill this in

