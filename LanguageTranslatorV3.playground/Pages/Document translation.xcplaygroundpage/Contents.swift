//:## Document translation

import Foundation
import LanguageTranslatorV3

let languageTranslator = setupLanguageTranslatorV3()
let modelID: String? = nil
let testDocumentID = "d1667bea-47d4-4cda-ab94-ccee6d3243af"

//:### List documents

languageTranslator.listDocuments() {
    response, error in
    
    guard let documents = response?.result?.documents else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(documents)
}

//:### Translate document

let testDocument = Bundle.main.url(forResource: "test-document", withExtension: "txt")
let testData = try! Data(contentsOf: testDocument!)

languageTranslator.translateDocument(file: testData, filename: "test-document.txt", source: "en-US", target: "es-ES") {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Get document status

languageTranslator.getDocumentStatus(documentID: testDocumentID) {
    response, error in
    
    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(result)
}

//:### Delete document

languageTranslator.deleteDocument(documentID: testDocumentID) {
    response, error in
    
    if let error = error {
        print(error.localizedDescription ?? "unknown error")
        return
    }
    
    print("Delete was successful")
}

//:### Get translated document

languageTranslator.getTranslatedDocument(documentID: testDocumentID) {
    response, error in
    
    guard let translatedDocument: Data? = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }
    
    print(translatedDocument)
}
