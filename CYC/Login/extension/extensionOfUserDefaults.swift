//
//  extensionOfUserDefaults.swift
//  CYC
//
//  Created by 황성진 on 12/12/23.
//

import Foundation

// 유저정보를 저장하기위한 extension
extension UserDefaults {
    private static let userLoginKey = "userLoginKey"

    func setUserLogin(_ login: String) {
        set(login, forKey: UserDefaults.userLoginKey)
    }

    func getUserLogin() -> String? {
        return string(forKey: UserDefaults.userLoginKey)
    }
}

extension UserDefaults {
    private static let userAcessToken = "acessToken"

    func setAccessToken(_ token: String) {
        set(token, forKey: UserDefaults.userAcessToken)
    }

    func getAccessToken() -> String? {
        return string(forKey: UserDefaults.userAcessToken)
    }
}
