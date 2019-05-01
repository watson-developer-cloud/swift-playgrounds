//:## Models

import LanguageTranslatorV3

let languageTranslator = setupLanguageTranslatorV3()
var modelID: String = ""

//:### List models

languageTranslator.listModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(models)
}

//:### Create model

let glossaryURL = Bundle.main.url(forResource: "glossary", withExtension: "tmx")
let glossary = try! Data(contentsOf: glossaryURL!)
languageTranslator.createModel(baseModelID: "en-es", forcedGlossary: glossary, name: "custom-en-es") {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    modelID = model.modelID
    print(model)
}

//:### Get model details

languageTranslator.getModel(modelID: modelID) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(model)
}

//:### Delete model

languageTranslator.deleteModel(modelID: modelID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("model deleted")
}
