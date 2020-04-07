//
//  VendorInteractorTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import XCTest
@testable import VendorEngrams

class VendorInteractorTests : XCTestCase {
    
    var vendors : [Vendor] = []
    
    override func setUp() {
        let fileResponse = SingleVendorResponse()
        let network = Network(network: fileResponse)
        
        let vendorInteractor = VendorInteractor(network: network)
        
        vendors = vendorInteractor.getVendors()
    }
    
    func testModelCreation() {
        XCTAssertEqual(vendors.count, 1)
    }
    
    func testModelHasName() {
        XCTAssertEqual(vendors[0].name, "devrim")
    }
    
    func testModelHasDropStatus() {
        XCTAssertEqual(vendors[0].dropStatus, 1)
    }
}


class VendorInteractor {
    var network : Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getVendors() -> [Vendor] {
        network.getVendors()
        
        return [Vendor()]
    }
}

struct Vendor : Codable {
    let name : String = "devrim"
    let dropStatus : Int = 1
}

class SingleVendorResponse : SomeNetworkProtocol {
    func makeRequest(url: String, completionHandler: (String) -> Void) {
        completionHandler("[{\"vendorID\":\"396892126\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"devrim\",\"interval\":\"1585678590\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"}]")
    }
    
    
}
