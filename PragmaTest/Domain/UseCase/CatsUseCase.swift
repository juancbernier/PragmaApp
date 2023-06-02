//
//  CatsUseCase.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation


class CatsUseCase  {
    
    
    var catRepository : DefaultDataSourceProtocol?
  
    init(catDefaultDataSourceProtocol: DefaultDataSourceProtocol) {
        self.catRepository = catDefaultDataSourceProtocol
    }
    //3.
    func getCats(complition: @escaping([CatCell]) -> Void){
        catRepository?.getCatsDTO(completion: { cats in
            complition(cats ?? [])
        })
    }
}
