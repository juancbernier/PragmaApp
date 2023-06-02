//
//  DefaultDataSourceProtocol.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation



//MARK: -  Protocolo de cumplimiento para pasar a la capa de dominio
protocol DefaultDataSourceProtocol {
    //aseguramos que recibamos exactamente esta estructura
    func getCatsDTO(completion: @escaping ([CatCell]?) -> Void)
}
