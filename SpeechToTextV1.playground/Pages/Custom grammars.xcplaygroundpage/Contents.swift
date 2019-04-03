//:## Custom grammars

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
let modelID = getLanguageModelID()
let grammarName = "list-abnf"

//:### Add a grammar

let url = Bundle.main.url(forResource: "list", withExtension: "abnf")
let grammarFile = try! String(contentsOf: url!)
speechToText.addGrammar(
    customizationID: modelID,
    grammarName: grammarName,
    grammarFile: grammarFile,
    contentType: "application/srgs")
{
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("successfully added grammar")
    // Poll for grammar status.
}

//:### Get a grammar

speechToText.getGrammar(customizationID: modelID, grammarName: grammarName) {
    response, error in

    guard let grammar = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(grammar)
}

//:### List grammars

speechToText.listGrammars(customizationID: modelID) {
    response, error in

    guard let grammars = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(grammars)
}

//:### Delete a grammar

speechToText.deleteGrammar(customizationID: modelID, grammarName: grammarName) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("grammar deleted successfully")
}
