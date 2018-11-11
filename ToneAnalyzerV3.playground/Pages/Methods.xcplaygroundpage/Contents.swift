//:## Methods

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import ToneAnalyzerV3

let toneAnalyzer = setupToneAnalyzerV3()

//:### Analyze general tone

let text = """
I know the times are difficult! Our sales have been disappointing for the past three quarters for \
our data analytics product suite. We have a competitive data analytics product suite in the industry. \
But we need to do our job selling it!
"""

toneAnalyzer.tone(toneContent: .text(text)) {
    response, error in
    guard let toneAnalysis = response?.result else {
        print(error as Any)
        return
    }
    print(toneAnalysis)
}

//:### Analyze customer engagement tone

let utterances = [
    Utterance(text: "Hello, I'm having a problem with your product.", user: "customer"),
    Utterance(text: "OK, let me know what's going on, please.", user: "agent"),
    Utterance(text: "Well, nothing is working :(", user: "customer"),
    Utterance(text: "Sorry to hear that.", user: "agent"),
]

toneAnalyzer.toneChat(utterances: utterances, acceptLanguage: "en") {
    response, error in

    guard let analyses = response?.result else {
        print(error as Any)
        return
    }
    print(analyses)
}
