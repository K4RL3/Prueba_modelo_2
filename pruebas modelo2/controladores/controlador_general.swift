//
//  controlador_general.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

@Observable
class ControladorGeneral{
    public var mensajes: [Mensaje]
    public var usuarios: [Usuario]
    
    init() {
        mensajes = []
        usuarios = []
    }
    
    func agregarMensaje() {
        mensajes += [Mensaje(texto: "mensaje de \(mensajes.count + 1)", id_usuario: nil)]
    }
    
    func agregarUsuario( _ usuario_nuevo: Usuario) {
        usuarios.append(usuario_nuevo)
        
        print("la cantidad actual de usuarios es: \(usuarios.count)")
    }
}

