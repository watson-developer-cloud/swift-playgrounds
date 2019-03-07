//:## Queries

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID =  getEnvironmentID()
let collectionID = getCollectionID(environmentID: environmentID)

//:### Long collection queries

discovery.query(
    environmentID: environmentID,
    collectionID: collectionID,
    query: "relations.action.lemmatized:acquire")
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Query system notices

discovery.queryNotices(
    environmentID: environmentID,
    collectionID: collectionID,
    filter: "entities.text:error")
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Long environment queries

discovery.federatedQuery(
    environmentID: environmentID,
    query: "relations.action.lemmatized:acquire",
    collectionIDs: [collectionID].joined(separator: ","))
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Query multiple collection system notices

discovery.federatedQueryNotices(
    environmentID: environmentID,
    collectionIDs: [collectionID],
    filter: "entities.text:error")
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Knowledge Graph entity query

discovery.queryEntities(
    environmentID: environmentID,
    collectionID: collectionID,
    feature: "disambiguate",
    entity: QueryEntitiesEntity(text: "Steve", type: "Person"),
    context: QueryEntitiesContext(text: "iphone"),
    count: 100)
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}

//:### Knowledge Graph relationship query

let steveJobs = QueryRelationsEntity(text: "Steve Jobs", type: "Person", exact: true)
let iphone = QueryEntitiesContext(text: "iphone")
let filter = QueryRelationsFilter(
    relationTypes: QueryFilterType(
        exclude: ["colocation"],
        include: ["locatedAt", "employedBy", "managerOf", "founderOf"]),
    entityTypes: QueryFilterType(
        exclude: ["EVENT"],
        include: ["PERSON", "GPE", "ORGANIZATION"]),
    documentIDs: ["document1", "document2"])
discovery.queryRelations(
    environmentID: environmentID,
    collectionID: collectionID,
    entities: [steveJobs],
    context: iphone,
    sort: "score",
    filter: filter,
    count: 10)
{
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
