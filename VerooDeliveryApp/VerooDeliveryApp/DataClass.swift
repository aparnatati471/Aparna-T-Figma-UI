//
//  DataClass.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 08/06/22.
//

import Foundation

struct UserLoginRequest: Codable {
    let email: String
    let password: String
}

struct UserLoginResponse: Codable {
    let token: String
}

struct UserRegisterRequest: Codable {
    let email: String
    let password: String
}

struct UserRegisterResponse: Codable {
    let id: Int
    let token: String
}

struct Error: Codable {
    let error: String
}
