//
//  Provider.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation



protocol ProviderVMProtocol {
    func provideCatsViewModel() -> CatViewModel
}


class Provider : ProviderVMProtocol {
    
    //1
    let catsRemote = NetworkDataSource()

    func provideCatsViewModel() -> CatViewModel{
        var useCase = CatsUseCase(catDefaultDataSourceProtocol: getCatRepository())
        return CatViewModel(catUseCase: useCase)
    }
    private func getCatRepository() -> DefaultDataSourceProtocol{
        return  DefaultDataSource(remoteDataSource: catsRemote)

    }
    
    


}
