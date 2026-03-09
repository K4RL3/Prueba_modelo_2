//
//  previista_mensaje.swift
//  pruebas modelo2
//
//  Created by alumno on 3/9/26.
//

import SwiftUI

struct PrevistaMensaje: View {
    var mensaje: Mensaje
    
    var body: some View {
            HStack(spacing: 12) {
                        
                        Image(systemName: "message.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(.blue)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(mensaje.id_usuario ?? "Anónimo")
                                .font(.headline)
                            
                            Text(mensaje.texto)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                    )

                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)

                }
            }

#Preview {
    PrevistaMensaje(mensaje: mensajes_falsos[0])
}
