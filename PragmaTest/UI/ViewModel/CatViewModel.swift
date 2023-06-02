//
//  CatViewModel.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation
import Combine


class CatViewModel : ObservableObject{
    
    //subject Observable
    @Published var cats = [CatCell]()
    
    private var catUseCase : CatsUseCase

    init(catUseCase: CatsUseCase){
        self.catUseCase = catUseCase
        loadCats()
    }
    
    func loadCats() {
        DispatchQueue.global().async { [self] in
            catUseCase.getCats { cats in
                DispatchQueue.main.async {
                    self.cats = cats
                }
            } 
        }
  
    }
    
}
