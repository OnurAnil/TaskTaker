//
//  User.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
