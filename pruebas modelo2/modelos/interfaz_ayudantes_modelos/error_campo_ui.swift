//
//  error_campo_ui.swift
//  pruebas modelo2
//
//  Created by alumno on 3/4/26.
//

enum NivelError{
    case fatal
    case nhaa
    case ninguno
}

struct ErrorUI{
    let campo: String
    let error: String
    let nivel_error: NivelError
}
