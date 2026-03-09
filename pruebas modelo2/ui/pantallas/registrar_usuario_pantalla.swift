//
//  registrar_usuario_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

enum CamoposRegistrarUsuario: String {
    case nombre = "nombre"
    case apodo = "apodo"
    case edad = "edad"
    case instagram = "instagram"
}

struct RegistroUsuario: View {
    @Environment(ControladorGeneral.self) var controlador
    @Environment(\.dismiss) var salir
    
    @State var nombre: String = ""
    @State var edad: String = ""
    @State var apodo: String = ""
    @State var instagram: String = ""
    
    @State var error: ErrorUI? = nil
    
    var body: some View {
        if(error != nil){
            Text("Hay un porblema resuelve")
        }
        
        VStack{
            //TextField("Nombre ", text: $nombre)
            CampoTexto(
                entrada: $nombre,
                placeholder: "Nombre",
                error: error,
                id: CamoposRegistrarUsuario.nombre.rawValue
            )
            //TextField("Apodo ", text: $apodo)
            CampoTexto(
                entrada: $apodo,
                placeholder: "Apodo",
                error: error,
                id: CamoposRegistrarUsuario.apodo.rawValue
            )
            //TextField("Edad ", text: $edad)
            CampoTexto(
                entrada: $edad,
                placeholder: "Edad",
                error: error,
                id: CamoposRegistrarUsuario.edad.rawValue
            )
            //TextField("Instagram ", text: $instagram)
            CampoTexto(
                entrada: $instagram,
                placeholder: "Instagram",
                error: error,
                id: CamoposRegistrarUsuario.instagram.rawValue
            )

            
            Button(action: { validarEntradas() }) {
                HStack {
                    Text("Agregar usuario")
                        .fontWeight(.semibold)
                    Image(systemName: "person.fill.badge.plus")
                        .font(.title2)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
    func validarEntradas(){
        if(nombre.isEmpty){
            error = ErrorUI(
                campo: CamoposRegistrarUsuario.nombre.rawValue, error: "no tienes nombre o q", nivel_error: .fatal
            )
            return
        }
        if(apodo.isEmpty){
            error = ErrorUI(
                campo:  CamoposRegistrarUsuario.apodo.rawValue, error: "no me gusta cambialo lol", nivel_error: .fatal
            )
            return
        }
        if(apodo.isEmpty){
            error = ErrorUI(
                campo:  CamoposRegistrarUsuario.edad.rawValue, error: "pos cuantos años tienes tons", nivel_error: .fatal
            )
            return
        }
        if(apodo.isEmpty){
            error = ErrorUI(
                campo:  CamoposRegistrarUsuario.instagram.rawValue, error: "pero agrega tu instagram", nivel_error: .fatal
            )
            return
        }
        
        controlador.agregarUsuario(crearUsuario())
        salir() // Salir de la ventana
        apodo = ""
        nombre = ""
        edad = ""
        instagram = ""
    }
    
    func crearUsuario() -> Usuario {
        return Usuario(
            nombre: nombre,
            edad: Int(edad)!,
            apodo: apodo,
            instagram: instagram
        )
    }
}

#Preview {
    RegistroUsuario()
        .environment(ControladorGeneral())
}
