//
//  LoginModel.swift
//  CYC
//
//  Created by 황성진 on 12/11/23.
//

import Foundation
import Alamofire

class LoginModel: ObservableObject {
    
    static let shared = LoginModel()
    
    @Published var code: String?
    @Published var access_token: String?
    @Published var userLogin: String?
    
    let scope = "user"
    
    var loginURL: URL? {
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&redirect_uri=\(redirectURL)&scope=user"
        return URL(string: urlString)
    }
    
    func handleCodeFromURL(_ url: URL) -> Bool {
        if let code = url.absoluteString.components(separatedBy: "code=").last {
            self.code = code
            return true
        }
        return false
    }
    
    func get_access_token() {
        let params = ["client_id": client_id,
                      "client_secret": client_secret,
                      "code": code]
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request("https://github.com/login/oauth/access_token",
                   method: .post, parameters: params,
                   headers: headers).responseJSON { response in
            switch response.result {
            case let .success(json):
                if let dic = json as? [String: String] {
//                    print(dic)
                    let accessToken = dic["access_token"] ?? ""
                    self.access_token = accessToken
                    print(self.access_token!)
                    self.getUser()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
//    func getUser() {
//        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
//                                    "Authorization": "Bearer \(access_token!)"]
//
//        AF.request("https://api.github.com/user",
//                   method: .get, parameters: [:],
//                   headers: headers).responseString(completionHandler: { (response) in
//            switch response.result {
//            case .success(let json):
//                print(json)
//            case .failure:
//                print("외않되")
//            }
//        })
//    }
    
    struct User: Decodable {
        let login: String
    }

    func getUser() {
        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
                                    "Authorization": "Bearer \(access_token!)"]
        
        AF.request("https://api.github.com/user",
                   method: .get, parameters: [:],
                   headers: headers).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                print(user.login)
                self.userLogin = user.login
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
