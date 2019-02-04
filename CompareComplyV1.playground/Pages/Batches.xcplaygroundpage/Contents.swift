//:## Batches

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Submit a batch-processing request

var newBatchID = ""

let inputCredentialsFile = Bundle.main.url(forResource: "cos_input_creds", withExtension: "json")!
let outputCredentialsFile = Bundle.main.url(forResource: "cos_output_creds", withExtension: "json")!
compareComply.createBatch(
    function: "element_classification",
    inputCredentialsFile: inputCredentialsFile,
    inputBucketLocation: "us-geo",
    inputBucketName: "my_cos_input_bucket",
    outputCredentialsFile: outputCredentialsFile,
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
