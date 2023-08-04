//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Zeynep Bayrak Demirel on 1.08.2023.
//

import Foundation

struct CryptoCurrency : Hashable,  Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    // codingKey bir protokol. hangi değişkenin hangi isimde geleceğini belirtebilceğimiz bir yapı.çekeceğimiz dosyada abuk subuk isimler olabilirdi. currency yerine CurrEncY falan yazabilirdi, onun için.
    private enum CodingKeys : String, CodingKey {
        
        case currency = "currency" // = "cUrRen123cy" şeklinde falan olabilirdi mesela.
        case price = "price"
        
    }
    
    
    
}
