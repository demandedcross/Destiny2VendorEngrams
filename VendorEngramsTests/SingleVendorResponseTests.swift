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

class SingleVendorResponseTests : XCTestCase {
    
    var vendors : [Vendor] = []
    
    override func setUp() {
        let expectation = XCTestExpectation()
        
        let fileResponse = SingleVendorResponse()
        let network = Network(network: fileResponse)
        
        let vendorInteractor = VendorInteractor(network: network)
        
        vendorInteractor.getVendors(completionHandler: {vendorsResult in
            vendors = vendorsResult
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testModelCreation() {
        XCTAssertEqual(vendors.count, 1)
    }
    
    func testModelHasName() {
        XCTAssertEqual(vendors[0].name, "Devrim")
    }
    
    func testModelHasDropStatus() {
        XCTAssertEqual(vendors[0].dropStatus, "Low")
    }
}

class SingleVendorResponse : SomeNetworkProtocol {
    let json = """
    [{\"vendorID\":\"396892126\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"devrim\",\"interval\":\"1585678590\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"}]
    """
    
    func makeRequest(url: String, completionHandler: (Data) throws -> Void) {
        do {
            try completionHandler(Data(json.utf8))
        } catch {
            
        }
    }
    
    
}
