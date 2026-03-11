//
//  pantalla_basica.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

struct PantallaBasica: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        Text("Twitter knock off")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
        Spacer()
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(controlador.usuarios){ usuario in
                    NavigationLink{
                        PerfilPantalla(usuario: usuario)
                    }
                    label:{
                        EtiquetaUsuarioPerfil(usuario: usuario)
                            .padding(3)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                ForEach(controlador.mensajes){mensaje in
                    NavigationLink{
                        PantallaMensaje(mensaje: mensaje)
                    }
                    label:{
                        PrevistaMensaje(mensaje: mensaje)
                            .padding()
                    }
                    .onAppear {
                        print("holi soy la vista de \(mensaje)")
                    }
                }
            }
        }
        
        Spacer()
        
        HStack(spacing: 12) {
                        
                        Button {
                            controlador.agregarMensaje()
                        } label: {
                            Text("Nuevo mensaje")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        
                        NavigationLink {
                            RegistroUsuario()
                        } label: {
                            Text("Agregar usuario")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
