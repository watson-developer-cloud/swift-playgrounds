//:## Element classification

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Classify the elements of a document

let url = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
let contract = try! Data(contentsOf: url)
compareComply.classifyElements(file: contract, fileContentType: "application/pdf") {
    response, error in

    guard let classification = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classification)
}
