//
//  NetworkTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import XCTest
import Combine
@testable import VendorEngrams

class NetworkTests : XCTestCase {
    
    func testCanMakeNetworkCall() {
        let networkProtocol = MockNetworkProtocol()
        
        let network = Network(network: networkProtocol)
        
        network.getVendors()
        
        XCTAssertEqual(networkProtocol.capturedUrlString, "https://api.vendorengrams.xyz/getVendorDrops")
    }
}

class MockNetworkProtocol : SomeNetworkProtocol {

    func makeRequest(url: String) -> AnyPublisher<Data, VendorError> {
         capturedUrlString = url
        
        return PassthroughSubject<Data, VendorError>() .eraseToAnyPublisher()
    }

    public var capturedUrlString : String = ""
}

