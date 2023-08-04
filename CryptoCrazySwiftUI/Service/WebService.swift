//
//  WebService.swift
//  CryptoCrazySwiftUI
//
//  Created by Zeynep Bayrak Demirel on 1.08.2023.
//

import Foundation

class WebService {
    
    //completion yapmama ve result kullanmama gerek yok. direkt bana ne döndürceğini yazabiliyorum.
    func downloadCurrenciesAsync(url:URL) async throws -> [CryptoCurrency] {
        //dataTask yerine data kullanıyoruz.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    //@escaping: bu fonksiyonun çalışması uzun sürecek, iş bitince bana şunu ver(result). ya crypto verecek ya da hata.
  /* func downloadCurrencies (url: URL, completion: @escaping (Result<[CryptoCurrency]?,DownloaderError>)-> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL)) // YA URL YANLIŞ
            }
            guard let data = data, error == nil else {
                return completion(.failure(.noData)) // YA VERİ GELMEDİ
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError)) // YA DA VERİYİ PARSE EDEMEDİK
            }
            completion(.success(currencies))
        }.resume()
    }*/
}


enum DownloaderError : Error {
    
    case badURL
    case noData
    case dataParseError
}
