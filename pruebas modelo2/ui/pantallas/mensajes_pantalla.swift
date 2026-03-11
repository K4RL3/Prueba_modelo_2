//
//  mensajes_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct PantallaMensaje: View {
    
    var mensaje: Mensaje
    
    @State private var liked = false
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack(spacing: 12) {
                    
                    Image("gallo_con_tenis")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())

                    
                    VStack(alignment: .leading) {
                        
                        Text(mensaje.id_usuario ?? "Anónimo")
                            .font(.headline)
                        
                        Text("@usuario · ahora")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Text(mensaje.texto)
                    .font(.title3)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.08), radius: 6)
                
                HStack(spacing: 30) {
                    
                    Button {
                        liked.toggle()
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .foregroundStyle(liked ? .red : .secondary)
                            .font(.title3)
                            .scaleEffect(liked ? 1.2 : 1)
                            .animation(.spring(duration: 0.3), value: liked)
                    }
                    
                    Button {
                        print("Responder")
                    } label: {
                        Image(systemName: "bubble.left")
                    }
                    
                    Button {
                        print("Compartir")
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                }
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(-2)
                
                Spacer()
                
            }
            .padding()
        }
        .navigationTitle("Mensaje")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PantallaMensaje(mensaje: mensajes_falsos[0])
}
