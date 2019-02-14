//:## Translation

import LanguageTranslatorV3

let languageTranslator = setupLanguageTranslatorV3()

//:### Translate

languageTranslator.translate(text: ["Hello"], modelID: "en-es") {
    response, error in

    guard let translation = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(translation)
}
