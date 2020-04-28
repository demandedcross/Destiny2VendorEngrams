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
    let interactor = StubVendorInteractor()
     var receivedVendors : [VendorVM] = []
        let expectation = XCTestExpectation()
    
    override func setUp() {
        let presenter = VendorsPresenter(vendorInteractor: interactor)
        
        _ = presenter.displayVendors()
            .sink(receiveCompletion: { completion in
              switch completion {
              case .finished:
                  break
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }, receiveValue: { vendors in
            self.receivedVendors = vendors
            self.expectation.fulfill()
          }).store(in: &disposables)
        
    }
    
    func testVendorsWithDisplayStatusFalseAreExcluded() {
    
        interactor.sendVendors()
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(receivedVendors.count, 1)
        XCTAssertEqual(receivedVendors[0].name, "Vendor1")
        
    }
    
    func testFanboyIsTranslatedToVance() {
        interactor.sendFanboy()
        
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(receivedVendors.count, 1)
        XCTAssertEqual(receivedVendors[0].name, "Vance")
    }
    
    func testDropStatusExamplesAreTranslatedForView() {
        interactor.sendDropStatusExamples()
        
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(receivedVendors.count, 3)
        
        XCTAssertEqual(receivedVendors[0].dropping, "No Data")
        XCTAssertEqual(receivedVendors[1].dropping, "Low")
        XCTAssertEqual(receivedVendors[2].dropping, "High")
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
    
    func sendFanboy() {
        publisher.send(fanboy)
    }
    
    func sendDropStatusExamples() {
        publisher.send(dropStatusExamples)
    }
    
    let fanboy = [Vendor(name: "fanboy", dropStatus: "", id: "", displayStatus: true)]
    
    let vendors = [Vendor(name: "vendor1", dropStatus: "0", id: "id1", displayStatus: true),
                    Vendor(name: "vendor2", dropStatus: "0", id: "id2", displayStatus: false)]
    
    let dropStatusExamples = [Vendor(name: "vendor1", dropStatus: "0", id: "id1", displayStatus: true),
                              Vendor(name: "vendor2", dropStatus: "1", id: "id2", displayStatus: true),
                                Vendor(name: "vendor2", dropStatus: "2", id: "id2", displayStatus: true)]
    
}
