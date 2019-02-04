//:## Tables

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Extract a document's tables

let table = Bundle.main.url(forResource: "TestTable", withExtension: "pdf")!
compareComply.extractTables(file: table, fileContentType: "application/pdf") {
    response, error in

    guard let table = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(table)
}
