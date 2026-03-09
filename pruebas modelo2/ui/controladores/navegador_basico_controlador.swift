//
//  ContentView.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct NavegadorBasico: View {
    @Environment(ControladorGeneral.self) var control
    
    var body: some View {
        /*NavigationStack {
           PantallaBasica()
        }*/
        
        TabView{
            Tab("Mensaje",systemImage: "message"){
                NavigationStack{
                    PantallaBasica()
                }
            }
            .badge(control.mensajes.count)
            Tab("Agregar usuario",systemImage: "person.badge.plus"){
                RegistroUsuario()
            }
            Tab("cosas que tengo",systemImage: "shippingbox"){
                Text("esta es la pantalla de inventario")
            }
            Tab("una ultima cosa",systemImage: "ellipsis.circle"){
                Text("esta es la pantalla de cosas random")
            }
        }
    }
}


#Preview {
    NavegadorBasico()
        .environment(ControladorGeneral())
}
