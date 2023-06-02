//
//  DefaultDataSource.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation


//MARK: - Nuestro Default
class DefaultDataSource: DefaultDataSourceProtocol {

    
    let remote : RemoteDataSourceProtocol

    init(remoteDataSource : RemoteDataSourceProtocol){
        self.remote = remoteDataSource
    }
    
    func getCatsDTO(completion: @escaping ([CatCell]?) -> Void) {
        //4.
        remote.getCats { cats in
            if let newCats = cats {
                completion(newCats.mapToDomain())
            }
        }
    }
}
