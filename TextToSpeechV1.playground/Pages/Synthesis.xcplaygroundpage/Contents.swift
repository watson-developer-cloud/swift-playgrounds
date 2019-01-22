//:## Synthesis

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()

//:### Synthesize audio

textToSpeech.synthesize(text: "Hello World", accept: "audio/wav", voice: "en-US_AllisonVoice") {
    response, error in

    guard let audio = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    let audioFile = playgroundSharedDataDirectory.appendingPathComponent("hello_world.wav")
    do {
        try audio.write(to: audioFile)
        print("Audo saved to \(audioFile.lastPathComponent)")
    } catch {
        print("Error writing: \(error)")
    }
}
