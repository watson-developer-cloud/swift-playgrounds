//:## Element classification

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Classify the elements of a document

let contract = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
compareComply.classifyElements(file: contract) {
    response, error in

    guard let classification = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(classification)
}
