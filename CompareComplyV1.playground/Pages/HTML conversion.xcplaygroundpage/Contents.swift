//:## HTML Conversion

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Convert file to HTML

let contract = Bundle.main.url(forResource: "contract_A", withExtension: "pdf")!
compareComply.convertToHTML(file: contract) {
    response, error in

    guard let htmlDocument = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(htmlDocument)
}
