//:## Analyze text

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import NaturalLanguageUnderstandingV1

let naturalLanguageUnderstanding = setupNaturalLanguageUnderstandingV1()

//:### Classify a phrase

let text = "IBM is an American multinational technology " +
    "company headquartered in Armonk, New York, " +
    "United States, with operations in over 170 countries."

let features = Features(entities: EntitiesOptions(limit: 2, sentiment: true, emotion: true),
                        keywords: KeywordsOptions(limit: 2, sentiment: true, emotion: true))
naturalLanguageUnderstanding.analyze(features: features, text: text) {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Categories

let categories = Features(categories: CategoriesOptions())
naturalLanguageUnderstanding.analyze(features: categories, url: "www.ibm.com") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Concepts

let concepts = Features(concepts: ConceptsOptions(limit: 2))
naturalLanguageUnderstanding.analyze(features: concepts, url: "www.ibm.com") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Emotion

let html = "<html><head><title>Fruits</title></head>" +
    "<body><h1>Apples and Oranges</h1>" +
    "<p>I love apples! I don't like oranges.</p>" +
    "</body></html>"

let emotion = Features(emotion: EmotionOptions(targets: ["apples", "oranges"]))
naturalLanguageUnderstanding.analyze(features: emotion, html: html) {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Entities

let entities = Features(entities: EntitiesOptions(limit: 1, sentiment: true))
naturalLanguageUnderstanding.analyze(features: entities, url: "www.cnn.com") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Keywords

let keywords = Features(keywords: KeywordsOptions(limit: 3, sentiment: true, emotion: true))
naturalLanguageUnderstanding.analyze(features: keywords, url: "www.ibm.com") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Metadata

let metadata = Features(metadata: MetadataOptions())
naturalLanguageUnderstanding.analyze(features: metadata, url: "www.ibm.com") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Relations

let text2 = "Leonardo DiCaprio won Best Actor" +
           " in a Leading Role for his performance."
let relations = Features(relations: RelationsOptions())
naturalLanguageUnderstanding.analyze(features: relations, text: text2) {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Semantic Roles

let text3 = "IBM has one of the largest in the world"
let semanticRoles = Features(semanticRoles: SemanticRolesOptions())
naturalLanguageUnderstanding.analyze(features: semanticRoles, text: text3) {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}

//:### Sentiment

let sentiment = Features(sentiment: SentimentOptions(targets: ["stocks"]))
naturalLanguageUnderstanding.analyze(features: sentiment, url: "www.wsj.com/news/markets") {
    response, error in

    guard let analysis = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(analysis)
}
