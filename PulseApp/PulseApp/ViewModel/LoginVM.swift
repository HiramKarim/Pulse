//
//  LoginVM.swift
//  PulseApp
//
//  Created by Hiram Castro on 20/01/21.
//

import Foundation

struct LoginVM {
    
    var email:String?
    var password:String?
    
    var formIsValid:Bool {
        return !(email?.isEmpty ?? true)
            && !(password?.isEmpty ?? true)
    }
    
}
