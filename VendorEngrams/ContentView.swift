//
//  ContentView.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 03/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vendors: VendorsVM
    
    var body: some View {
        List(vendors.vendors) { vendor in
            Text("\(vendor.name): \(vendor.dropStatus)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
