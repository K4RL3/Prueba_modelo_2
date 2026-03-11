//
//  registrar_usuario_pantalla.swift
//  pruebas modelo2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

enum CamposRegistrarUsuario: String {
    case nombre, apodo, edad, instagram
}

struct RegistroUsuario: View {
    
    @Environment(ControladorGeneral.self) var controlador
    @Environment(\.dismiss) var salir
    
    @State private var nombre: String = ""
    @State private var apodo: String = ""
    @State private var edad: String = ""
    @State private var instagram: String = ""
    
    @State private var error: String? = nil
    @State private var showingAlert = false
    
    var body: some View {
        
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            NavigationStack {
                VStack(spacing: 20) {
                    
                    CampoPersonalizado(entrada: $nombre, placeholder: "Nombre")
                    CampoPersonalizado(entrada: $apodo, placeholder: "Apodo")
                    CampoPersonalizado(entrada: $edad, placeholder: "Edad", keyboard: .numberPad)
                    CampoPersonalizado(entrada: $instagram, placeholder: "Instagram")
                    
                    Button {
                        validarEntradas()
                    } label: {
                        HStack {
                            Image(systemName: "person.fill.badge.plus")
                            Text("Agregar usuario")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(14)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .navigationTitle("Registrar Usuario")
                .padding()
            }
            
        }
        .alert(error ?? "", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func validarEntradas() {
        if nombre.isEmpty { mostrarError("Eso que pon un nombre"); return }
        if apodo.isEmpty { mostrarError("Apoco asi te llaman"); return }
        if edad.isEmpty || Int(edad) == nil { mostrarError("Apoco no te sabes cuantos años tienes"); return }
        if instagram.isEmpty { mostrarError("Agrega tu Instagram para stalkearte"); return }
        
        controlador.agregarUsuario(crearUsuario())
        salir()
        limpiarCampos()
    }
    
    func mostrarError(_ mensaje: String) {
        error = mensaje
        showingAlert = true
    }
    
    func crearUsuario() -> Usuario {
        return Usuario(
            nombre: nombre,
            edad: Int(edad) ?? 0,
            apodo: apodo,
            instagram: instagram
        )
    }
    
    func limpiarCampos() {
        nombre = ""
        apodo = ""
        edad = ""
        instagram = ""
    }
}

struct CampoPersonalizado: View {
    @Binding var entrada: String
    var placeholder: String
    var keyboard: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $entrada)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            .keyboardType(keyboard)
    }
}

#Preview {
    NavigationStack {
        RegistroUsuario()
            .environment(ControladorGeneral())
    }
}
