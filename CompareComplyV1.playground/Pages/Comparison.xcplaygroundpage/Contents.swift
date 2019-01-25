
import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Compare two documents

let contractA = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
let contractB = Bundle.main.url(forResource: "contract_B", withExtension: "pdf")!
compareComply.compareDocuments(file1: contractA, file2: contractB) {
    response, error in

    guard let comparison = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(comparison)
}
