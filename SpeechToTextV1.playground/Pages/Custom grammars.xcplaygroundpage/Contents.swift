//:## Custom grammars

import SpeechToTextV1

let speechToText = setupSpeechToTextV1()
let customizationID = "{customization-id}"
let grammarName = "list-abnf"

//:### Add a grammar

let grammarFile = Bundle.main.url(forResource: "list", withExtension: "abnf")!
speechToText.addGrammar(
    customizationID: customizationID,
    grammarName: grammarName,
    grammarFile: grammarFile.absoluteString,
    contentType: "application/srgs")
{
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("successfully added grammar")
}

//:### Get a grammar

speechToText.getGrammar(customizationID: customizationID, grammarName: grammarName) {
    response, error in

    guard let grammar = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(grammar)
}


//:### List grammars

speechToText.listGrammars(customizationID: customizationID) {
    response, error in

    guard let grammars = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(grammars)
}

//:### Delete a grammar

speechToText.deleteGrammar(customizationID: customizationID, grammarName: grammarName) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("grammar deleted successfully")
}
