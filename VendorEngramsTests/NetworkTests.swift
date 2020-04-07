//
//  NetworkTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import XCTest
@testable import VendorEngrams

class NetworkTests : XCTestCase {
    
    func testCanMakeNetworkCall() {
        let networkProtocol = MockNetworkProtocol()
        
        let network = Network(network: networkProtocol)
        
        network.getVendors(completionHandler: {_ in
            
        })
        
        XCTAssertEqual(networkProtocol.capturedUrlString, "https://api.vendorengrams.xyz/getVendorDrops")
    }
}

class MockNetworkProtocol : SomeNetworkProtocol {
    public var capturedUrlString : String = ""

    func makeRequest(url: String, completionHandler: (Data) throws -> Void) {
        capturedUrlString = url
        
    }
}

class RealNetworkProtocol : SomeNetworkProtocol {
    func makeRequest(url: String, completionHandler: (Data) throws -> Void) {
        do {
            try completionHandler(Data())
        } catch {
            
        }
    }
}
