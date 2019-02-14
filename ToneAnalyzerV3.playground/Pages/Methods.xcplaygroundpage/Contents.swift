//:## Methods

import ToneAnalyzerV3

let toneAnalyzer = setupToneAnalyzerV3()

//:### Analyze general tone

let text = """
Team, I know that times are tough! Product \
sales have been disappointing for the past three \
quarters. We have a competitive product, but we \
need to do a better job of selling it!
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
