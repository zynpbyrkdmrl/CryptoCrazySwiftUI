//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Zeynep Bayrak Demirel on 1.08.2023.
//

import Foundation

//ObservableObject sık karlaşılan bir şey. Burdaki herhangi bir değişikliği main viewda gözlemleyebileceğiz. @published. bu structlarda kullanılmadıgı için class yaptık.

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = WebService()
    
    func downloadCryptos (url: URL) {
        webservice.downloadCurrencies(url: url) { result in
        
            switch result {
            case.failure(let error):
                print(error)
            case.success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                    
                }
            }
        }
    }
    
    
}

struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
}
