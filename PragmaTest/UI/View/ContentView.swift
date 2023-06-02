//
//  ContentView.swift
//  PragmaTest
//
//  Created by Juan Bernier on 2/06/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    //2
    @ObservedObject  var catDataList = Provider().provideCatsViewModel()

    var body: some View {
        List(catDataList.cats, id: \.id) { cat in
          
            VStack(spacing: 20){
                //MARK: - Nombre del gato
                Text(cat.catsName)
                    .bold()
                    
                
                //MARK: - Imagen del gato
                AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(cat.catsReferenceImageId).jpg")) { image in
                    image
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                } placeholder: {
                    Text("Imagen no disponible") // el icono de carga junto al texto se deplegaran en caso tal que la imagen este corrupta.
                    Image(systemName: "x.square") // Icono de carga
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                            .frame(width: 100, height: 100)
                            .background(Color.white)
                            .cornerRadius(10)
                }


                //MARK: - Inteligencia y Origen
                HStack(alignment: .center){
                    Spacer()
                    Text("Origen: \(cat.catsOrigin)")
                    Spacer()
                    Text("Inteligance: \(cat.catsIntelligence)")
                    Spacer()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
