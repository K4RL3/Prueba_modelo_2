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
        Text("esta pantalla me mueve a la siguiente opcion")
        
        Spacer()
        
        ForEach(controlador.mensajes){mensaje in
            NavigationLink{
                Text("Esta es la pantalla del \(mensaje.texto)")
            }
            label:{
                Text("pulsa para ver tu mesnaje: \(mensaje.texto)")
            }
            .onAppear {
                print("holi soy la vista de \(mensaje)")
            }
        }
        
        Spacer()
        
        Text("Agregar un hola mundo")
            .onTapGesture {
                controlador.agregarMensaje()
            }
        
        
        NavigationLink{
            // que pantalla debe sobreponer
            RegistroUsuario()
            
        }
    label:{
            //apariencia del boton
        Text("Agregar usuario")
        }
        
        Spacer()
            
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
