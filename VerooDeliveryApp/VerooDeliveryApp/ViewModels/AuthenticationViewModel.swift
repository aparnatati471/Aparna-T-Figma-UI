//
//  SignInVM.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 08/06/22.
//

import Foundation

class AuthenticationViewModel: BaseViewModel {
    
    func login(user: UserLoginRequest) {
        let param = ["email" : user.email, "password": user.password]
        self.isLoading.value = true
        GenericClass.shared.request(typeT: UserLoginResponse.self, type: APIs.login, parameters: param, completion:{ [weak self] response, code in
            self?.authenticationToken.value = response?.token
            print("Login Successfully! And Your token is: ", response?.token ?? "No token")
            self?.isLoading.value = false
            guard response != nil else { return }
        }, failure: { [weak self] code, errorMessage in
            self?.failureMessage.value = code
            self?.isLoading.value = false
        })
    }
    
    func register(user: UserRegisterRequest) {
        let param = ["email" : user.email, "password": user.password]
        self.isLoading.value = true
        GenericClass.shared.request(typeT: UserRegisterResponse.self, type: APIs.register, parameters: param, completion:{ [weak self] response, code in
            self?.authenticationToken.value = response?.token
            print("Register Successfully! And Your token is: ", response?.token ?? "No token")
            self?.isLoading.value = false
            guard response != nil else { return }
        }, failure: { [weak self] code, errorMessage in
            self?.failureMessage.value = code
            self?.isLoading.value = false
        })
    }
    
}
