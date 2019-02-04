//:## Feedback

import CompareComplyV1

let compareComply = setupCompareComplyV1()

//:### Add feedback

var newFeedbackID = ""

let location = Location(begin: 214, end: 237)
let text = """
1. IBM will provide a Senior Managing Consultant / expert resource, \
for up to 80 hours, to assist Florida Power & Light (FPL) with the creation \
of an IT infrastructure unit cost model for existing infrastructure.
"""

let originalType1 = TypeLabel(
    label: Label(nature: "Obligation", party: "IBM"),
    provenanceIDs: ["85f5981a-ba91-44f5-9efa-0bd22e64b7bc", "ce0480a1-5ef1-4c3e-9861-3743b5610795"]
)
let originalType2 = TypeLabel(
    label: Label(nature: "Exclusion", party: "End User"),
    provenanceIDs: ["85f5981a-ba91-44f5-9efa-0bd22e64b7bc", "ce0480a1-5ef1-4c3e-9861-3743b5610795"]
)
let originalCategory1 = CompareComplyV1.Category(
    label: "Responsibilities",
    provenanceIDs: ["85f5981a-ba91-44f5-9efa-0bd22e64b7bc"]
)
let originalCategory2 = CompareComplyV1.Category(
    label: "Amendments",
    provenanceIDs: []
)
let originalLabels = OriginalLabelsIn(types: [originalType1, originalType2], categories: [originalCategory1, originalCategory2])

let updatedType1 = TypeLabel(
    label: Label(nature: "Obligation", party: "IBM"),
    provenanceIDs: nil
)
let updatedType2 = TypeLabel(
    label: Label(nature: "Disclaimer", party: "Buyer"),
    provenanceIDs: nil
)
let updatedCategory1 = CompareComplyV1.Category(
    label: "Responsibilities",
    provenanceIDs: nil
)
let updatedCategory2 = CompareComplyV1.Category(
    label: "Audits",
    provenanceIDs: nil
)
let updatedLabels = UpdatedLabelsIn(types: [updatedType1, updatedType2], categories: [updatedCategory1, updatedCategory2])

let document = ShortDoc(title: "Legal Approval SOW", hash: "91edc2ff254d29f7a4922635ad47276a")
let modelID = "contracts"
let modelVersion = "2.0.1"

let feedbackData = FeedbackDataInput(
    feedbackType: "element_classification",
    location: location,
    text: text,
    originalLabels: originalLabels,
    updatedLabels: updatedLabels,
    document: document,
    modelID: modelID,
    modelVersion: modelVersion)

compareComply.addFeedback(
    feedbackData: feedbackData,
    userID: "7uy9c1f4-57dd-42b5-9586-a2ddf3ed8b64",
    comment: "user comments")
{
    response, error in

    guard let feedback = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    newFeedbackID = feedback.feedbackID ?? ""
    print(feedback)
}

//:### List the feedback in documents

compareComply.listFeedback() {
    response, error in

    guard let allFeedback = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(allFeedback)
}

//:### List a specified feedback entry

compareComply.getFeedback(feedbackID: newFeedbackID) {
    response, error in

    guard let feedback = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
    }

    print(feedback)
}

//:### Delete a specified feedback entry

compareComply.deleteFeedback(feedbackID: newFeedbackID) {
    _, error in

    if let error = error {
        print(error)
        return
    }

    print("deleted feedback")
}
