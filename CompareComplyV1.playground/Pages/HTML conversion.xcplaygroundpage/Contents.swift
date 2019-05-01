//:## HTML Conversion

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Convert file to HTML

let url = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
let contract = try! Data(contentsOf: url)
compareComply.convertToHTML(file: contract, filename: "contract_A.pdf") {
    response, error in

    guard let htmlDocument = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(htmlDocument)
}
