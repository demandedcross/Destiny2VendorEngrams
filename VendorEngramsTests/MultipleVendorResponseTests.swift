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
        
        vendorInteractor.getVendors { (vendors) in
            vendors.sink { (vs) in
                self.vendors = vs
                expectation.fulfill()
            }
        }
    
        wait(for: [expectation], timeout: 5)
    }
    
    func testModelCreation() {
        XCTAssertEqual(vendors.count, 12)
    }
    
    func testModelHasCorrectName() {
           XCTAssertEqual(vendors[1].name, "Sloane")
    }
    
    func testModelHasDropStatus() {
        XCTAssertEqual(vendors[1].dropStatus, "High")
    }
    
    func testNoDataDropStatus() {
        XCTAssertEqual(vendors[2].dropStatus, "No Data")
    }
    
    func testCanGetDisplayStatus() {
        XCTAssertEqual(vendors[1].displayStatus, true)
    }
    
    func testCanGetFalseDisplayStatus() {
        XCTAssertEqual(vendors[0].displayStatus, false)
    }
    
    func testUnexpectedValueGivesDisplayStatusFalse() {
          XCTAssertEqual(vendors[3].displayStatus, false)
    }
    
}
