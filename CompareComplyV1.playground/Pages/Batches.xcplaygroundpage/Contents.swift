//:## Batches

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Submit a batch-processing request

var newBatchID = ""

let inputCredentialsURL = Bundle.main.url(forResource: "cos_input_creds", withExtension: "json")!
let inputCredentials = try! Data(contentsOf: inputCredentialsURL)
let outputCredentialsURL = Bundle.main.url(forResource: "cos_output_creds", withExtension: "json")!
let outputCredentials = try! Data(contentsOf: outputCredentialsURL)
compareComply.createBatch(
    function: "element_classification",
    inputCredentialsFile: inputCredentials,
    inputBucketLocation: "us-geo",
    inputBucketName: "my_cos_input_bucket",
    outputCredentialsFile: outputCredentials,
    outputBucketLocation: "us-geo",
    outputBucketName: "my_cos_output_bucket")
{
    response, error in

    guard let batch = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    newBatchID = batch.batchID ?? ""
    print(batch)
}

//:### Get the list of submitted batch-processing jobs

compareComply.listBatches() {
    response, error in

    guard let allBatches = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(allBatches)
}

//:### Get information about a specific batch-processing request

compareComply.getBatch(batchID: newBatchID) {
    response, error in

    guard let batch = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(batch)
}

//:### Update a pending or active batch-processing request

compareComply.updateBatch(batchID: newBatchID, action: "rescan") {
    response, error in

    guard let batch = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(batch)
}
