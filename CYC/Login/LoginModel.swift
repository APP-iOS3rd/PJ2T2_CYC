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
//    @Published var access_token: String?
    @Published var testCase:[String:Int] = [:]
    
    // accesstoken 을 UserDefaults 저장하는 이유?
    // 커밋 기록을 불러올때 필요함
    // 로그인은 1회성이기 때문에 액세스 토큰을 만들어서 저장해 앱에 로그인 할때마다 불러옴
    @Published var access_token: String? {
        didSet {
            UserDefaults.standard.setAccessToken(access_token ?? "")
        }
    }
    
    // 다른 뷰에서 유저닉네임 받아주기 위해 선언
    // UserDefaults로 선언해서 값을 저장해 앱이 종료 되더라도 유저닉네임이 저장된다
    @Published var userLogin: String? {
        didSet {
            UserDefaults.standard.setUserLogin(userLogin ?? "")
        }
    }
    
    init() {
        self.userLogin = UserDefaults.standard.getUserLogin()
        self.access_token = UserDefaults.standard.getAccessToken()
    }
    
    let scope = "user"
    
    
    // 깃허브 api 에서 제공하는 형식의 로그인 페이지 연결 URL
    var loginURL: URL? {
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&redirect_uri=\(redirectURL)&scope=user"
        return URL(string: urlString)
    }
    
    // 로그인 완료시 지정한 redirectURL으로 전환되는데 그 뒤의 코드 값을 얻기위한 코드
    func handleCodeFromURL(_ url: URL) -> Bool {
        if let code = url.absoluteString.components(separatedBy: "code=").last {
            self.code = code
            return true
        }
        return false
    }
    
    // 코드값을 토대로 액세스 토큰을 얻기위한 함수
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
    
    struct User: Decodable {
        let login: String
        let name: String
    }
    
    // 유저정보를 받아오기 위한 함수
    func getUser() {
        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
                                    "Authorization": "Bearer \(access_token!)"]
        
        AF.request("https://api.github.com/user",
                   method: .get, parameters: [:],
                   headers: headers).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                self.userLogin = user.name
                print(self.userLogin ?? "외않되")
                self.getUserEvents()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    // 유저이벤트를 받아오기 위한 함수(push, pull request)
    func getUserEvents() {
        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
                                    "Authorization": "Bearer \(access_token!)"]
        let pageNum = [1, 2]
        var pushEvents:[String:Int] = [:]
        
        for num in pageNum{
            let parameters = ["per_page": 300,
                              "page": num]
            
            AF.request("https://api.github.com/users/\(self.userLogin ?? "")/events",
                       method: .get, parameters: parameters,
                       headers: headers)
            .responseDecodable(of: [Event].self) { response in
                switch response.result {
                case .success(let values):
                    for event in values {
                        let repoOwner = event.repo.name.split(separator: "/")[0]
                        if event.type == EventType.pullRequestEvent.rawValue{
                            let key = String(event.createdAt.prefix(10))
                            if pushEvents.keys.contains(key){
                                pushEvents[key]! += 2
                            }
                            else{
                                pushEvents[key] = 2
                            }
                        }
                        if event.type == EventType.pushEvent.rawValue && self.userLogin! == repoOwner{
                            let key = String(event.createdAt.prefix(10))
                            let value = (event.payload.commits ?? []).count
                            
                            if pushEvents.keys.contains(key){
                                pushEvents[key]! += value + 1
                            }
                            else{
                                pushEvents[key] = value + 1
                            }
                        }
                    }
                    self.testCase = pushEvents
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
