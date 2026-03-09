//
//  campo.swift
//  pruebas modelo2
//
//  Created by alumno on 3/4/26.
//

import SwiftUI

struct CampoTexto: View {
    @Binding var entrada: String
    
    var placeholder: String
    var error: ErrorUI?
    var id: String
    
    var body: some View {
        TextField(placeholder, text: $entrada)
        if(error?.campo == id){
            switch error!.nivel_error {
                case .fatal:
                    Text(error!.error)
                        .foregroundStyle(Color.red)
                    
                case .nhaa:
                    Text(error!.error)
                        .foregroundStyle(Color.yellow)
                    
                case .ninguno:
                    Text("")
            }
            
        }
    }
}

