//
//  NetworkTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import XCTest

class NetworkTests : XCTestCase {
    
    func testCanMakeNetworkCall() {
        let networkProtocol = MockNetworkProtocol()
        
        let network = Network(network: networkProtocol)
        
        network.getVendors()
        
        XCTAssertEqual(networkProtocol.capturedUrlString, "https://api.vendorengrams.xyz/getVendorDrops")
    }
}

protocol SomeNetworkProtocol {
    func makeRequest(url: String)
}

class Network {
    
    var network : SomeNetworkProtocol
    
    let endpoint = "https://api.vendorengrams.xyz/getVendorDrops"
    
    init(network: SomeNetworkProtocol) {
        self.network = network
    }
    
    func getVendors() {
        self.network.makeRequest(url: endpoint)
    }
}

class MockNetworkProtocol : SomeNetworkProtocol {
    public var capturedUrlString : String = ""
    
    func makeRequest(url: String) {
        capturedUrlString = url
    }
}
