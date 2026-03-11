//
//  Inventario_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct InventarioPantalla: View {
    
    let columnas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let objetos = [
        ("Zapatilla brillante", "shoe.fill"),
        ("Café infinito", "cup.and.saucer.fill"),
        ("Oscar perdido", "trophy.fill"),
        ("Guion secreto", "doc.text.fill"),
        ("Traje de superhéroe", "bolt.fill"),
        ("Lentes de estrella", "sunglasses.fill")
    ]
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: columnas, spacing: 16) {
                
                ForEach(objetos, id: \.0) { objeto in
                    
                    VStack(spacing: 12) {
                        
                        Image(systemName: objeto.1)
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                        
                        Text(objeto.0)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Inventario")
    }
}

#Preview {
    NavigationStack {
        InventarioPantalla()
    }
}
