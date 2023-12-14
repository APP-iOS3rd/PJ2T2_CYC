//
//  LoginModel.swift
//  CYC
//
//  Created by 황성진 on 12/11/23.
//

import Foundation
import Alamofire
import SwiftSoup

class LoginModel: ObservableObject {
    static let shared = LoginModel()
    
    @Published var code: String?
    // accesstoken 을 UserDefaults 저장하는 이유?
    // 커밋 기록을 불러올때 필요함
    // 로그인은 1회성이기 때문에 액세스 토큰을 만들어서 저장해 앱에 로그인 할때마다 불러옴
    @Published var access_token: String? {
        didSet {
            UserDefaults.standard.setAccessToken(access_token ?? "")
        }
    }
    
    // userName의 선언
    // API를 받아오기 위해선 userID 부분이 필요하지만
    // 우리가 뷰에 보여줘야 하는 부분은 유저의 닉네임 부분이여서 추가 선언
    @Published var userName: String? {
        didSet {
            UserDefaults.standard.setUserName(userName ?? "")
        }
    }
    
    // 다른 뷰에서 유저닉네임 받아주기 위해 선언
    // UserDefaults로 선언해서 값을 저장해 앱이 종료 되더라도 유저닉네임이 저장된다
    @Published var userLogin: String? {
        didSet {
            UserDefaults.standard.setUserLogin(userLogin ?? "")
        }
    }
    
    var results: [(String, String)] = []
    @Published var testCase:[String:Int] = [:]
    
    init() {
        self.userLogin = UserDefaults.standard.getUserLogin()
        self.access_token = UserDefaults.standard.getAccessToken()
        self.userName = UserDefaults.standard.getUserName()
    }
    
    let scope = "user"
    
    struct User: Decodable {
        let login: String
        let name: String
    }
    
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
    
    // 유저정보를 받아오기 위한 함수
    func getUser() {
        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
                                    "Authorization": "Bearer \(access_token!)"]
        
        AF.request("https://api.github.com/user",
                   method: .get, parameters: [:],
                   headers: headers).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                self.userLogin = user.login
                self.userName = user.name
                print(self.userName ?? "외않되")
                print(self.userLogin ?? "외않되")
                self.getCommitData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    func getCommitData() {
        if let url = URL(string: "http://github.com/users/\(self.userLogin!)/contributions") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    return
                }
                if let data = data, let html = String(data: data, encoding: .utf8) {
                    do {
                        let parsedHtml = try SwiftSoup.parse(html)
                        let dailyContribution = try parsedHtml.select("td")
                        
                        let validCommits = dailyContribution.compactMap { element -> (String, String)? in
                            guard
                                let dateString = try? element.attr("data-date"),
                                let levelString = try? element.attr("data-level"),
                                !dateString.isEmpty
                            else { return nil }
                            
                            return (dateString, levelString)
                        }
                        DispatchQueue.main.async {
                            self.dataToDictionary(validCommits)
                        }
                    } catch {
                        print("Error parsing HTML: \(error.localizedDescription)")
                    }
                } else {
                    print("No data received")
                }
            }
            task.resume()
            
        } else {
            print("Invalid URL")
        }
    }
    
    
    func dataToDictionary(_ data: [(String, String)]){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // 정렬된 데이터를 딕셔너리로 변환하고 날짜를 String으로 변환하여 데이터를 Int로 변경
        for tuple in data {
            if let date = dateFormatter.date(from: tuple.0) {
                let dateString = dateFormatter.string(from: date)
                let dataInt = Int(tuple.1) ?? 0 // 데이터를 Int로 변환, 실패하면 기본값 0
                self.testCase[dateString] = dataInt * 3
            }
        }
    }
    
    func logout() {
        
        // GitHub에 로그아웃을 위한 URL을 생성합니다.
        let logoutURL = "https://api.github.com/applications/Iv1.\(client_id)/grant"
        
        // 클라이언트 시크릿을 사용하여 요청을 인증합니다.
        let headers: HTTPHeaders = ["Accept": "application/vnd.github+json",
                                    "Authorization": "Bearer \(access_token!)",
                                    "X-GitHub-Api-Version": "2022-11-28"]
        
        let params = ["access_token": access_token!] as Dictionary
        
        // Alamofire를 사용하여 DELETE 요청을 수행합니다.
        AF.request(logoutURL, 
                   method: .delete, parameters: params, encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            // 로그아웃이 성공하면 현재 세션을 종료합니다.
            if let statusCode = response.response?.statusCode, statusCode == 204 {
                print("Logout successful")
            } else {
                // 로그아웃에 실패하면 에러 메시지를 출력합니다.
                print("Logout failed")
                print(response.response)
                if let error = response.error {
                    print("Error: \(error)")
                }
            }
        }
    }
}
