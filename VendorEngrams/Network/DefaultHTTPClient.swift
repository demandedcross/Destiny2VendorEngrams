//
//  DefaultHTTPClient.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 12/05/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class DefaultHTTPClient : SomeNetworkProtocol {
    func makeRequest(url: String) -> AnyPublisher<Data, VendorError> {
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: URL(string:url)!))
            .tryMap { data, response in
                return data
        }
        .mapError { error in
            .network(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
    
    func makeRequest(url: String, completionHandler: @escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            DispatchQueue.main.async {
                completionHandler(data!)
            }
        }
        
        task.resume()
    }
}
