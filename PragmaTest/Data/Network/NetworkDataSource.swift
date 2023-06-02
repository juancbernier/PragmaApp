//
//  NetworkDataSource.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation

protocol RemoteDataSourceProtocol{
    //para luego me cumpla esta funcion en el Default
    func getCats(completion: @escaping ([CatDTO]?) -> Void)
}

//MARK: - Peticion HTTP
class NetworkDataSource: RemoteDataSourceProtocol {
    func getCats(completion: @escaping ([CatDTO]?) -> Void) {
        
        let stringUrl = "https://api.thecatapi.com/v1/breeds"
        guard let url = URL(string: stringUrl) else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("URLSession Faild")
                return
            }
            guard let data = data else {
                print("No se recibieron datos válidos")
                return
            }

            do {
                let decoder = JSONDecoder()
                let cats = try decoder.decode([CatDTO].self, from: data)
                completion(cats)
                
            } catch {
                print("JSON Decode Failed \(error)")
            }
        }.resume()
    }
}
