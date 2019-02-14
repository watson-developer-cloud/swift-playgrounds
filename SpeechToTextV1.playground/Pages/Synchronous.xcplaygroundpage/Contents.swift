//:## Synchronous

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()

//:### Recognize audio

let audio = Bundle.main.url(forResource: "audio-file", withExtension: "flac")!
var settings = RecognitionSettings(contentType: "audio/flac")
settings.timestamps = true
settings.wordAlternativesThreshold = 0.90
settings.keywords = ["colorado", "tornado", "tornadoes"]
settings.keywordsThreshold = 0.5

speechToText.recognize(audio: audio, settings: settings) {
    response, error in

    guard let results = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(results)
}
