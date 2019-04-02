//:## Comparison

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Compare two documents

let urlA = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
let urlB = Bundle.main.url(forResource: "contract_B", withExtension: "pdf")!
let contractA = try! Data(contentsOf: urlA)
let contractB = try! Data(contentsOf: urlB)
compareComply.compareDocuments(
    file1: contractA,
    file2: contractB,
    file1ContentType: "application/pdf",
    file2ContentType: "application/pdf") {
    response, error in

    guard let comparison = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(comparison)
}
