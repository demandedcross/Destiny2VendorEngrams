//
//  LocalResponse.swift
//  VendorEngramsTests
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import VendorEngrams
import Combine

class LocalResponse : SomeNetworkProtocol {
    let publisher = PassthroughSubject<Data, VendorError>()
    
    func makeRequest(url: String) -> AnyPublisher<Data, VendorError> {
        return publisher.eraseToAnyPublisher()
    }
    
    func makeRequest(url: String, completionHandler: @escaping (Data) -> Void) {
        completionHandler(Data(json.utf8))
    }
    
    public func sendData() {
        publisher.send(Data(self.json.utf8))
    }
    
    
    let json = """
[{\"vendorID\":\"396892126\",\"display\":\"0\",\"drop\":\"1\",\"shorthand\":\"devrim\",\"interval\":\"1585678590\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"1062861569\",\"display\":\"1\",\"drop\":\"2\",\"shorthand\":\"sloane\",\"interval\":\"1585678464\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"1576276905\",\"display\":\"1\",\"drop\":\"0\",\"shorthand\":\"failsafe\",\"interval\":\"1585678892\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"3982706173\",\"display\":\"unexpectedValue\",\"drop\":\"1\",\"shorthand\":\"asher\",\"interval\":\"1585678343\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"69482069\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"zavala\",\"interval\":\"1585675922\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"3603221665\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"shaxx\",\"interval\":\"1585678222\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"672118013\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"banshee\",\"interval\":\"1586194700\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"1265988377\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"benedict\",\"interval\":\"1585687896\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"},{\"vendorID\":\"895295461\",\"display\":\"0\",\"drop\":\"1\",\"shorthand\":\"saladin\",\"interval\":\"1585661478\",\"nextRefresh\":\"2020-04-01T09:00:00Z\"},{\"vendorID\":\"2398407866\",\"display\":\"1\",\"drop\":\"0\",\"shorthand\":\"fanboy\",\"interval\":\"1586189015\",\"nextRefresh\":\"2020-04-08T09:00:00Z\"},{\"vendorID\":\"1735426333\",\"display\":\"1\",\"drop\":\"0\",\"shorthand\":\"bray\",\"interval\":\"1586246522\",\"nextRefresh\":\"2020-04-07T10:00:00Z\"},{\"vendorID\":\"880202832\",\"display\":\"1\",\"drop\":\"1\",\"shorthand\":\"werner\",\"interval\":\"1585695086\",\"nextRefresh\":\"2020-04-07T17:00:00Z\"}]
"""

}

