//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Zeynep Bayrak Demirel on 1.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListviewModel : CryptoListViewModel
    
    init(){
        self.cryptoListviewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            
            List(cryptoListviewModel.cryptoList, id:\.id){ crypto in
                
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
    
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.navigationTitle(Text("Crypto Crazy"))
        }.task { //.task async oldugu için kullanabiliyoruz. onAppearı kullanamayız.
            
            await cryptoListviewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            //await cryptoListviewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
            /*onAppear { //görünüm oluşturuldugnda yapılacaklar.
           cryptoListviewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
