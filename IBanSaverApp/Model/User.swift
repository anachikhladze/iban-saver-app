//
//  User.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
}

extension User {
    static let MOCK_USER = User(id: NSUUID().uuidString, fullname: "Test Test", email: "test@gmail.com")
}
