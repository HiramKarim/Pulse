//
//  SignupVM.swift
//  PulseApp
//
//  Created by Hiram Castro on 20/01/21.
//

import Foundation

struct SignupVM {
    
    var email: String?
    var phoneNumber: String?
    var fullName: String?
    var password: String?
    
    var formIsValid:Bool {
        return !(email?.isEmpty ?? true)
            && !(phoneNumber?.isEmpty ?? true)
            && !(fullName?.isEmpty ?? true)
            && !(password?.isEmpty ?? true)
    }
    
}
