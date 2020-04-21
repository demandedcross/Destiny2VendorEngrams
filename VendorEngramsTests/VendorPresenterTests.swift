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

//class VendorPresenterTests : XCTestCase {
//    
//    func testVendorsWithDisplayStatusFalseAreExcluded() {
//        let presenter = VendorsPresenter(vendorInteractor: StubVendorInteractor())
//        
//        
//        
//    }
//}
//
//
//class StubVendorInteractor: VendorInteractorProtocol {
//    
//    
//    
//    func getVendors() -> AnyPublisher<[Vendor], Error> {
//        
//    }
//    
//    
//    let vendors = [Vendor(name: "vendor1", dropStatus: "dropStatus1", id: "id1", displayStatus: true),
//                    Vendor(name: "vendor2", dropStatus: "dropStatus2", id: "id2", displayStatus: false)]
//    
//    func getVendors(completionHandler: @escaping (AnyPublisher<[Vendor], Never>) -> Void) {
//        completionHandler(
//            Just(vendors)
//                .eraseToAnyPublisher()
//        )
//    }
//}
