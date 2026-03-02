//
//  usuario.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import Foundation

struct Usuario: Identifiable{
    let id = UUID()
    
    let nombre: String
    let edad: Int
    let apodo: String
    let instagram: String
}
