//
//  pruebas_modelo2App.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

@main
struct pruebasModelo2App: App {
    @State var controlador = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            NavegadorBasico()
                .environment(controlador)
        }
    }
}
