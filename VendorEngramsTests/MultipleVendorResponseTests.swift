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
import Combine

class MultipleVendorResponseTests : XCTestCase {
    
    var vendors : [Vendor] = []
    private var disposables = Set<AnyCancellable>()

    
    override func setUp() {
        let expectation = XCTestExpectation()
        
        let fileResponse = LocalResponse()
        let network = Network(network: fileResponse)
        
        let vendorInteractor = VendorInteractor(network: network)
        
        vendorInteractor.getVendors()
           
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { vendors in
                self.vendors = vendors
                expectation.fulfill()
            }).store(in: &disposables)
        
        fileResponse.sendData()
        
    
        wait(for: [expectation], timeout: 5)
    }
    
    func testModelCreation() {
        XCTAssertEqual(vendors.count, 12)
    }
    
    func testModelHasCorrectName() {
           XCTAssertEqual(vendors[1].name, "sloane")
    }
    
    func testModelHasDropStatus() {
        XCTAssertEqual(vendors[1].dropStatus, "2")
    }
    
    func testNoDataDropStatus() {
        XCTAssertEqual(vendors[2].dropStatus, "0")
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
