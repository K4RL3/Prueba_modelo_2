//
//  registrar_usuario_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

struct RegistroUsuario: View {
    @State var nombre: String
    @State var edad: Int
    @State var apodo: String
    @State var instagram: String
    
    var body: some View {
        TextField("Nombre: ", text: $nombre)
    }
}
