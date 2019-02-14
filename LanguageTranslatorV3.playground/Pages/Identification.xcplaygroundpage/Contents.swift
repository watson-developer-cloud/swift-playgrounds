//:## Identification

import LanguageTranslatorV3

let languageTranslator = setupLanguageTranslatorV3()

//:### List identifiable languages

languageTranslator.listIdentifiableLanguages() {
    response, error in

    guard let languagesList = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(languagesList)
}

//:### Identify language

languageTranslator.identify(text: "Language translator translates text from one language to another") {
    response, error in

    guard let languages = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(languages)
}
