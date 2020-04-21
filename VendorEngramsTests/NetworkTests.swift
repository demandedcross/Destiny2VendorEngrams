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
        
        network.getVendors(completionHandler: {_ in
            
        })
        
        XCTAssertEqual(networkProtocol.capturedUrlString, "https://api.vendorengrams.xyz/getVendorDrops")
    }
}

class MockNetworkProtocol : SomeNetworkProtocol {
    func makeRequest(url: String, completionHandler: @escaping (Data) -> Void) {
        
    }
    
    func makeRequest(url: String) -> AnyPublisher<Data, VendorError> {
         capturedUrlString = url
        
        return PassthroughSubject<Data, VendorError>() .eraseToAnyPublisher()
    }

    public var capturedUrlString : String = ""
}


    
//struct StubPublisher: Publisher {
//    typealias Output = Data
//    
//    typealias Failure = VendorError
//    
//    var data : Data
//    
//    init(data: Data) {
//        self.data = data
//    }
//    
//    
//    func receive<S: Subscriber>(subscriber: S) where
//        StubPublisher.Failure == S.Failure, StubPublisher.Output == S.Input {
//        
//            let subscription = StubPublisher(request: urlRequest,
//                                                subscriber: subscriber)
//            
//            subscriber.receive(subscription: subscription)
//    }
//}


