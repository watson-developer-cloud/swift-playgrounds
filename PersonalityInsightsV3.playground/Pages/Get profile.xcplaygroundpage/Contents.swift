//:## Get profile

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import PersonalityInsightsV3

let personalityInsights = setupPersonalityInsightsV3()

//:### Get profile

let url = Bundle.main.url(forResource: "profile", withExtension: "json")!
let content = try JSONDecoder().decode(Content.self, from: Data(contentsOf: url))

personalityInsights.profile(profileContent: ProfileContent.content(content)) {
    response, error in

    guard let profile = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(profile)
}

