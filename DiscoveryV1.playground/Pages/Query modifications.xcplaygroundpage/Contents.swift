//:## Query modifications

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID = getEnvironmentID()
let collectionID = getCollectionID(environmentID: environmentID)

//:### Create or update expansion list

let expansion = Expansion(expandedTerms: ["international business machines", "big blue"], inputTerms: ["ibm"])
discovery.createExpansions(
    environmentID: environmentID,
    collectionID: collectionID,
    expansions: [expansion])
{
    response, error in

    guard let expansions = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(expansions)
}

//:### Get the expansion list

discovery.listExpansions(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let expansions = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(expansions)
}

//:### Delete the expansion list

discovery.deleteExpansions(environmentID: environmentID, collectionID: collectionID) {
    _, error in

    if let error = error {
        print(error.localizedDescription ?? "unexpected error")
        return
    }

    print("The expansion list was successfully deleted.")
}

//:### Create tokenization dictionary

let tokenizationRule = TokenDictRule(
    text: "すしネコ",
    tokens: ["すし", "ネコ"],
    readings: ["寿司", "ネコ"],
    partOfSpeech: "カスタム名詞"
)
discovery.createTokenizationDictionary(
    environmentID: environmentID,
    collectionID: collectionID,
    tokenizationRules: [tokenizationRule])
{
    response, error in

    guard let tokenDictStatus = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(tokenDictStatus)
}

//:### Get tokenization dictionary status

discovery.getTokenizationDictionaryStatus(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let tokenDictStatus = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(tokenDictStatus)
}

//:### Delete tokenization dictionary

discovery.deleteTokenizationDictionary(environmentID: environmentID, collectionID: collectionID) {
    _, error in

    if let error = error {
        print(error.localizedDescription ?? "unexpected error")
        return
    }

    print("tokenization dictionary deleted")
}

//:### Create stopword list

let stopwords = Bundle.main.url(forResource: "stopwords", withExtension: "txt")!
discovery.createStopwordList(
    environmentID: environmentID,
    collectionID: collectionID,
    stopwordFile: stopwords)
{
    response, error in

    guard let tokenDictStatus = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(tokenDictStatus)
}

//:### Get stopword list status

discovery.getStopwordListStatus(environmentID: environmentID, collectionID: collectionID) {
    response, error in

    guard let tokenDictStatus = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(tokenDictStatus)
}

//:### Delete a custom stopword list

discovery.deleteStopwordList(environmentID: environmentID, collectionID: collectionID) {
    _, error in

    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("success")
}
