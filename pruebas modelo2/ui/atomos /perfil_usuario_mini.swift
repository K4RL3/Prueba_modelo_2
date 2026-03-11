//
//  perfil_usuario_mini.swift
//  pruebas modelo2
//
//  Created by alumno on 3/9/26.
//

import SwiftUI

struct EtiquetaUsuarioPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        VStack(spacing: 12) {
            
            Text("Última conexión")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            ZStack(alignment: .bottomTrailing) {
                
                Image("gallo_con_tenis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 1)
                    )
                    .shadow(radius: 5)
                
                Circle()
                    .fill(usuario.conectado ? .green : .red)
                    .frame(width: 18, height: 18)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 1)
                    )
                    .offset(x: 2, y: 2)
            }
            
            Text(usuario.apodo)
                .font(.headline)
                .foregroundStyle(.blue)
            
            Text(usuario.conectado ? "En línea" : "Desconectado")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(width: 180)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        )
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
