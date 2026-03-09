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
        Text("Esta pantalla me mueve a la siguiente opcion")
        
        Spacer()
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(controlador.usuarios){ usuario in
                    NavigationLink{
                        Text("Esta es la pantalla del \(usuario)")
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
                        Text("Esta es la pantalla del \(mensaje)")
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
        
        Text("Agregar un hola mundo")
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .onTapGesture {
                controlador.agregarMensaje()
            }
        
        
        NavigationLink{
            RegistroUsuario()
            
        }
    label:{
        Text("Agregar usuario")
               .fontWeight(.semibold)
               .foregroundColor(.blue)
       }
       .padding(.top)
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
