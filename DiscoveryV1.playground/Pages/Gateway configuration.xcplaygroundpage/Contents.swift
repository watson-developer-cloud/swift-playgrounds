//:## Gateway Configuration

import PlaygroundSupport

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

import DiscoveryV1

let discovery = setupDiscoveryV1()
let environmentID: String! = getEnvironmentID()
var gatewayID = ""

//:### List gateways

discovery.listGateways(environmentID: environmentID) {
    response, error in

    guard let gatewayList = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(gatewayList)
}

//:### Create gateway

discovery.createGateway(environmentID: environmentID, name: "gateway_name") {
    response, error in

    guard let gateway = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    gatewayID = gateway.gatewayID!
    print(gateway)
}

//:### List gateway details

discovery.getGateway(environmentID: environmentID, gatewayID: gatewayID) {
    response, error in

    guard let gateway = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(gateway)
}

//:### Delete gateway

discovery.deleteGateway(environmentID: environmentID, gatewayID: gatewayID) {
    response, error in

    guard let result = response?.result else {
        print(error?.localizedDescription ?? "unexpected error")
        return
    }

    print(result)
}
