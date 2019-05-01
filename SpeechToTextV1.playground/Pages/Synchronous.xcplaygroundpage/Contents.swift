//:## Synchronous

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()

//:### Recognize audio

let url = Bundle.main.url(forResource: "audio-file", withExtension: "flac")
var audio = try! Data(contentsOf: url!)

speechToText.recognize(
    audio: audio,
    keywords: ["colorado", "tornado", "tornadoes"],
    keywordsThreshold: 0.5,
    wordAlternativesThreshold: 0.90,
    timestamps: true,
    contentType: "audio/flac")
{
    response, error in

    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(results)
}
