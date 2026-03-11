//
//  perfiles_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct         PerfilPantalla: View {
    
    var usuario: Usuario
    @State private var siguiendo = false
    @State private var mostrarFotoGrande = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ZStack(alignment: .bottomTrailing) {
                    Image("gallo_con_tenis")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .onTapGesture { mostrarFotoGrande.toggle() }
                    
                    Circle()
                        .fill(usuario.conectado ? .green : .gray)
                        .frame(width: 18, height: 18)
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                        .offset(x: 2, y: 2)
                }
                
                VStack(spacing: 6) {
                    Text(usuario.nombre)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("@\(usuario.apodo)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Edad: \(usuario.edad)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if !usuario.instagram.isEmpty {
                        Text("Instagram: @\(usuario.instagram)")
                            .font(.caption2)
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                HStack(spacing: 30) {
                    Button {
                        siguiendo.toggle()
                    } label: {
                        Text(siguiendo ? "Siguiendo" : "Seguir")
                            .fontWeight(.semibold)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(siguiendo ? Color.gray.opacity(0.3) : Color.blue)
                            .foregroundColor(siguiendo ? .black : .white)
                            .cornerRadius(12)
                    }
                    
                    Button {
                        print("Enviar mensaje")
                    } label: {
                        HStack {
                            Image(systemName: "message.fill")
                            Text("Mensaje")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                
                Divider()
                
            }
            .padding()
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        
        .fullScreenCover(isPresented: $mostrarFotoGrande) {
            ZStack(alignment: .topTrailing) {
                Color.black.ignoresSafeArea()
                
                Image("gallo_con_tenis")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                
                Button(action: { mostrarFotoGrande.toggle() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
                PerfilPantalla(usuario: usuarios_falsos[0])
    }
}
