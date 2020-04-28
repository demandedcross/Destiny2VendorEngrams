//
//  VendorPresenterTests.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 21/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import XCTest
import Combine
@testable import VendorEngrams

class VendorPresenterTests : XCTestCase {
    
    private var disposables = Set<AnyCancellable>()
    
    func testVendorsWithDisplayStatusFalseAreExcluded() {
        let expectation = XCTestExpectation()
               
        let interactor = StubVendorInteractor()
        let presenter = VendorsPresenter(vendorInteractor: interactor)
        var receivedVendors : [Vendor] = []
        
        _ = presenter.displayVendors()
            .sink(receiveCompletion: { completion in
              switch completion {
              case .finished:
                  break
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }, receiveValue: { vendors in
              receivedVendors = vendors
              expectation.fulfill()
          }).store(in: &disposables)
        
        interactor.sendVendors()
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(receivedVendors.count, 1)
        XCTAssertTrue(receivedVendors[0].displayStatus)
        
    }
}


class StubVendorInteractor: VendorInteractorProtocol {
    
    let publisher = PassthroughSubject<[Vendor], Error>()
    
    func getVendors() -> AnyPublisher<[Vendor], Error> {

        return publisher.eraseToAnyPublisher()
    }
    
    func sendVendors(){
        publisher.send(vendors)
    }
    
    
    let vendors = [Vendor(name: "vendor1", dropStatus: "dropStatus1", id: "id1", displayStatus: true),
                    Vendor(name: "vendor2", dropStatus: "dropStatus2", id: "id2", displayStatus: false)]
    
}
