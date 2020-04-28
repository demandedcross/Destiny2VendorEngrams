//
//  RefreshingScrollView.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 28/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import SwiftUI
import Combine

final class RefreshingScrollView : UIViewRepresentable {
    
    var width : CGFloat
    var height : CGFloat
    
    var vendors = VendorsVM()
    var presenter: VendorPresenterProtocol
 
    init(width: CGFloat, height: CGFloat, presenter: VendorPresenterProtocol) {
        self.width = width
        self.height = height
        self.presenter = presenter
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, presenter: presenter, model: vendors)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
        let childView = UIHostingController(rootView: SwiftUIList().environmentObject(vendors))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator: NSObject {
        var control: RefreshingScrollView
        var presenter : VendorPresenterProtocol
        var model : VendorsVM
        private var disposables = Set<AnyCancellable>()
        
        init(_ control: RefreshingScrollView, presenter: VendorPresenterProtocol, model: VendorsVM) {
            self.control = control
            self.presenter = presenter
            self.model = model
        }
        
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            self.presenter.displayVendors()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    sender.endRefreshing()
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: { vendors in
                    self.model.vendors = vendors
                }).store(in: &self.disposables)
        }
    }
    
}


struct SwiftUIList: View {
        
@EnvironmentObject var model: VendorsVM
    
var body: some View {
    List(model.vendors){
            vendor in
              Text("\(vendor.name): \(vendor.dropping)")
        }
    }
}
