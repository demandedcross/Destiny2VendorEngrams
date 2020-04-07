//
//  MultipleVendorResponseTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

import XCTest
@testable import VendorEngrams

class MultipleVendorResponseTests : XCTestCase {
    
    var vendors : [Vendor] = []
    
    override func setUp() {
        let expectation = XCTestExpectation()
        
        let fileResponse = LocalResponse()
        let network = Network(network: fileResponse)
        
        let vendorInteractor = VendorInteractor(network: network)
        
        vendorInteractor.getVendors(completionHandler: {vendorsResult in
            vendors = vendorsResult
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testModelCreation() {
        XCTAssertEqual(vendors.count, 12)
    }
}
