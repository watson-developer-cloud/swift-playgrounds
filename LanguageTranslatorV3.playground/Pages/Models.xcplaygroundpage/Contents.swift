//:## Models

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import LanguageTranslatorV3

let languageTranslator = setupLanguageTranslatorV3()
var modelID: String!

//:### List models

languageTranslator.listModels() {
    response, error in

    guard let models = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    print(models)
}

//:### Create model

let glossary = Bundle.main.url(forResource: "glossary", withExtension: "tmx")

languageTranslator.createModel(baseModelID: "en-es", name: "custom-en-es", forcedGlossary: glossary) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "missing result")
        return
    }

    modelID = model.modelID
    print(model)
}

//:### Get model details

languageTranslator.getModel(modelID: modelID) {
    response, error in

    guard let model = response?.result else {
        print(error?.localizedDescription ?? "missing result")
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
