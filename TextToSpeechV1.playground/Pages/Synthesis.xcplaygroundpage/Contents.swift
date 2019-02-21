//:## Synthesis

import TextToSpeechV1

let textToSpeech = setupTextToSpeechV1()

//:### Synthesize audio

textToSpeech.synthesize(text: "Hello World", accept: "audio/wav", voice: "en-US_AllisonVoice") {
    response, error in

    guard let audio = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    let audioFile = URL(fileURLWithPath: NSTemporaryDirectory() + "hello_world.wav")
    do {
        try audio.write(to: audioFile)
        print("Audio saved to \(audioFile.lastPathComponent)")
    } catch {
        print("Error writing: \(error)")
    }
}
