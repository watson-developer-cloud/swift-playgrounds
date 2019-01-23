//:## Asynchronous

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
var jobId: String = ""

//:### Register a callback

let url = "https://watson-test-resources.mybluemix.net/speech-to-text-async/secure/callback"
speechToText.registerCallback(callbackURL: url, userSecret: "ThisIsMySecret") {
    response, error in

    guard let registerStatus = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(registerStatus)
}

//:### Create a job

let audio = Bundle.main.url(forResource: "audio-file", withExtension: "flac")!

speechToText.createJob(
    audio: Data(contentsOf: audio),
    contentType: "audio/flac",
    callbackURL: url,
    userToken: "job25",
    timestamps: true)
{
    response, error in

    guard let job = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    jobId = job.id
    print(job)
}

//:### Check jobs

speechToText.checkJobs() {
    response, error in

    guard let jobs = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(jobs)
}

//:### Check a job

speechToText.checkJob(id: jobId) {
    response, error in

    guard let job = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(job)
}

//:### Delete a job

speechToText.deleteJob(id: jobId) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The job was successfully deleted.")
}

//:### Unregister a callbck

speechToText.unregisterCallback(callbackURL: url) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("The callback URL was successfully unregistered.")
}
