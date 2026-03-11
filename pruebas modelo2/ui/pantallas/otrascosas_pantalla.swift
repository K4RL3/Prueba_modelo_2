//
//  otrascosas_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct PantallaCosas: View {
    
    var body: some View {
        
        List {
            
            Section("Extras") {
                
                Button("Generar mensaje random") {
                    print("mensaje random")
                }
                
                Button("Agregar usuario loco") {
                    print("nuevo usuario")
                }
            }
            
            Section("Información") {
                
                NavigationLink("Estadísticas") {
                    Text("estadísticas y asi")
                        .navigationTitle("Estadísticas")
                }
                
                NavigationLink("Acerca de la app") {
                    Text("la hice yo y asi 217769")
                        .navigationTitle("Acerca de")
                }
            }
        }
        .navigationTitle("Otras cosas")
    }
}

#Preview {
    NavigationStack {
        PantallaCosas()
    }
}
