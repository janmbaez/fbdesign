//
//  Product.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 31/10/23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
}

var ProductList = [Product(name: "Termo", price: 2500),
                   Product(name: "T-shirt", price: 1500),
                   Product(name: "Design", price: 500),
                   Product(name: "Web-Design", price: 30000),
                   Product(name: "App-Design", price: 25000)]
