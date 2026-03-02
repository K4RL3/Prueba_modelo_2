//
//  mensaje.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import Foundation

struct Mensaje: Identifiable {
    let id = UUID()
    let texto: String
    let id_usuario: String?
}
