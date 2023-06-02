//
//  DTO.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import Foundation




//MARK: - Estructura para descodificar el JSON - DTO

struct CatDTO : Codable{
    let name: String
    let origin: String
    let intelligence: Int
    let reference_image_id: String?
    
}


//MARK: - mapToDomain extension CatDTO -> CatCell
extension [CatDTO] {
    func mapToDomain() -> [CatCell]{
        var cell : [CatCell] = []
        for cat in self{
            cell.append(CatCell(catsName: cat.name, catsOrigin: cat.origin, catsIntelligence: cat.intelligence, catsReferenceImageId: cat.reference_image_id ?? ""))
        }
        return cell
    }
}
