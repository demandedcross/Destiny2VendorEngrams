//
//  ContentView.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 03/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    let presenter: VendorPresenterProtocol
    
    init(presenter: VendorPresenterProtocol) {
        self.presenter = presenter
    }
    
    var body: some View {
        GeometryReader{
            geometry in
            NavigationView{
                RefreshingScrollView(width: geometry.size.width, height: geometry.size.height, presenter: self.presenter)
                    .navigationBarTitle(Text("Vendors"))
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: PreviewPresenter())
    }
    
    class PreviewPresenter : VendorPresenterProtocol {
        func displayVendors() -> AnyPublisher<[VendorVM], Error> {
             return publisher.eraseToAnyPublisher()
        }
        
        let publisher = PassthroughSubject<[VendorVM], Error>()
    
          
       
        let vendors = [VendorVM(name: "vendor1", dropping:"High"),
                       VendorVM(name: "vendor2", dropping:"High"),
                       VendorVM(name: "vendor3", dropping:"Low"),
                       VendorVM(name: "vendor4", dropping:"No Data"),
                       VendorVM(name: "vendor5", dropping:"No Data"),
                         ]
        
    }
}
