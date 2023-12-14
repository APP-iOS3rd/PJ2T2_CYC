# <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> PJ2T2_CYC <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40">

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 목차

1. [소개](#-소개)
2. [주요기능](#❗-주요기능)
3. [실행화면](#📱-실행-화면)
4. [타임라인](#⏰-타임라인)
5. [트러블슈팅](#❓-트러블-슈팅)
6. [개발환경 및 라이브러리](#💻-개발환경-및-라이브러리)
7. [Tree](#🌲-tree)

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 소개

### 1일 1커밋을 하고 싶은데 자꾸 까먹어.. 알림 있었으면 좋겠다..

> `열정 많은 개발자`, push 해야되는데 잊어버린 마감 급한 개발자 등등을 위한 1일 1커밋 강요앱  
> 저희 CYC(Check your commit)는 크게 commit 알림 기능, 간단한 todo list를 갖고 있습니다.

#### 👨‍👩‍👧‍👦 팀원

|[강치우](https://github.com/kangciu)|[김명현](https://github.com/kmh5038)|[이민영](https://github.com/Mminy62)|[황민채](https://github.com/Hminchae)|[황성진](https://github.com/Hsungjin)|
|-----------|-----------|-----------|------------|------------|
|<img src="https://avatars.githubusercontent.com/u/112779139?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/144766297?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/66752398?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/103357078?v=4" width="100">|<img src="https://avatars.githubusercontent.com/u/120264964?s=400&u=cfba7c275af35a6823aee13f536b5a08d8f71a52&v=4" width="100">|

#### 🔗 Links

- [📄 Notion](https://grateful-lemongrass-93f.notion.site/Check-Your-Commit-6142b220db1a43cc90dd2a45bf8d1062?pvs=4)
- [🖌️ Figma](https://www.figma.com/file/R6VtqCKvHOqAfwCT4eJigH/Check-Your-Commit?type=design&node-id=0%3A1&mode=design&t=sPzQFRbQJtw6fSGw-1)

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 주요기능

1. 깃허브 OAuth를 통한 로그인 연동
   - OAuth AcessToken을 바탕으로 유저 정보를 활용
   - 유저 정보를 custom ProgressView, GrassView 등 활용
2. 목표달성을 도와주는 챌린지 설정
   - MainView에서 D-Day를 제공함으로, 목표를 가시적으로 확인
3. 오늘 커밋을 위해 할일을 기록하는 TodoList
4. 알람을 통해 일정시간마다 커밋 체크

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 실행 화면

|앱 화면|
|:--:|
|<img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/ca70e57d-05f5-4bbb-a779-0b0bf6c4a989" width="">|

|라이트 모드|다크 모드|
|:--:|:--:|
|<img src="-" width="300">|<img src="-" width="300">|

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 타임라인

<details>
<summary>Step 1 타임라인</summary>

- 23.12.5 ~ 23.12.6
  - 팀빌딩
  - 아이디어 토의
  - 아이디어 구현 방안 토의

</details>

<details>

<summary>Step 2 타임라인</summary>

- 23.12.06 ~ 23.12.07
  - Figma를 기본 디자인 프로토타입 제작
  - 각 기능별 구현 방안 토의
  - 각 파트별 역할 분배
  - 프로젝트 개발 시작
- 23.12.12 ~ 23.12.13
  - 앱 아이콘 제작

</details>

<details>
<summary>Step 3 타임라인</summary>

- 23.12.06
  - 기본 앱 구조 제작
  - 커스텀 폰트, 컬러 Aseet 적용
- 23.12.07 ~ 23.12.11
  - 깃허브 OAuth 로그인 구현
  - OAuth 데이터를 통해 유저 정보 받아오는 부분 구현
- 23.12.07 ~ 23.12.14
  - 알림기능 구현
  - Todo List 구현
- 23.12.11 ~ 23.12.14
  - 깃허브 API를 이용한 GrassView 구현
  - 깃허브 API로 받아온 커밋일수로 D-day 계산기 구현
- 23.12.14
  - 라이트 모드, 다크모드 변환 버튼 구현

</details>

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/07efd7af-52fa-4a0a-9c65-ade6de6275ed" width="40"> 트러블 슈팅

### Step1

<details>
<summary>API를 통해 JSON 유저 데이터가 정상적으로 불러와지지 않음</summary>

- `Git API`를 통해 유저 데이터가 JSON 형식으로 불러와지지 않는 문제

```Swift
func getUser() {
        let accessToken = KeychainSwift().get("accessToken") ?? ""
        let headers: HTTPHeaders = ["Accept": "application/vnd.github.v3+json",
                                    "Authorization": "token \(accessToken)"]
        
        AF.request(githubApiURL+ApiPath.USER.rawValue,
                   method: .get,
                   parameters: [:],
                   headers: headers).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let json):
                print(json as! [String: Any])
            case .failure:
                print("")
            }
        })
    }
```

- [깃허브 유저 API 공식문서]("https://docs.github.com/ko/rest/users/users?apiVersion=2022-11-28#get-the-authenticated-user") 해당 문서의 형태로 curl 을 사용하면 정상적으로 JSON 형태의 데이터가 받아와 지는 것을 확인
- API를 받아오는 과정에서 responseJSON 의 형태가 아니라 responseString 혹은 responseDecodable 으로 사용하면 정상적으로 데이터가 받아와 지는 것을 확인
- struct를 통해 User를 선언하고 responseDecodable 로 해당 데이터를 할당시키는 방법으로 활용

```Swift
    struct User: Decodable {
        let login: String
        let name: String
    }

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
                self.getCommitData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
```

- REST API의 주소가 명확한지 확인하기위해 curl의 활용법을 알게됨.

</details>

### Step2

<details>
<summary>UserDefaults의 사용</summary>

- `API` 를 활용하기 위해서는 액세스토큰 값이 절대적으로 필요, 앱을 종료 시켜도 해당 값은 유효해야 됨
- AppStorage를 사용하려 했지만 다른 뷰에서도 사용하고 참조해야 되기 때문에 사용이 어려움

```Swift
class LoginModel: ObservableObject {

    static let shared = LoginModel()

    @Published var code: String?
    @Published var access_token: String?
    @Published var userLogin: String?
```

- UserDefaults 로 해당 변수들을 선언하고 extension을 통해 set, get 부분을 적용
- init() 부분을 통해 선언된 변수를 초기화

```Swift
    @Published var access_token: String? {
        didSet {
            UserDefaults.standard.setAccessToken(access_token ?? "")
        }
    }
    
    @Published var userName: String? {
        didSet {
            UserDefaults.standard.setUserName(userName ?? "")
        }
    }

    @Published var userLogin: String? {
        didSet {
            UserDefaults.standard.setUserLogin(userLogin ?? "")
        }
    }
    
    var results: [(String, String)] = []
    @Published var testCase:[String:Int] = [:]
    
    // UserDefaults로 선언된 변수를 사용하기 위한 init 부분
    init() {
        self.userLogin = UserDefaults.standard.getUserLogin()
        self.access_token = UserDefaults.standard.getAccessToken()
        self.userName = UserDefaults.standard.getUserName()
    }


// UserDefaults의 extension 부분 
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

    extension UserDefaults {
        private static let userNickname = "userNickname"

        func setUserName(_ name: String) {
            set(name, forKey: UserDefaults.userNickname)
        }

        func getUserName() -> String? {
            return string(forKey: UserDefaults.userNickname)
        }
    }
```

</details>

## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> 개발환경 및 라이브러리

    SwiftUI
    Xcode 15.1
    iOS 17.1
    Language - Swift 5.5.3
    알람 - UserNotification
    API - Alamofire
    Todo - SwiftData
    GrassView - SwiftSoup


## <img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/df66d998-8c93-4021-8a4b-939b88563ab3" width="40"> Tree

```
📦CYC
 ┣ 📂 Main
 ┃ ┗ 📜 MainView.swift
 ┣ 📂 Login
 ┃ ┃ ┣ 📂 extension
 ┃ ┃ ┗ 📜 extensionOfUserDefaults.ttf
 ┃ ┣ 📜 OnboardingTabView.swift
 ┃ ┣ 📜 LoginView.swift
 ┃ ┗ 📜 LoginModel.swift
 ┃ ┃ ┣ 📂 Font
 ┣ 📂 Setting
 ┃ ┣ 📂 PersonProfile
 ┃ ┃ ┣ 📂 View
 ┃ ┃ ┃ ┣ 📜 PersonGridView.swift
 ┃ ┃ ┃ ┗ 📜 AboutCYC.swift
 ┃ ┃ ┣ 📂 Model
 ┃ ┃ ┃ ┗ 📜 PersonModel.swift
 ┃ ┣ 📂 ViewModel
 ┃ ┃ ┣ 📜 LicenseViewModel.swift
 ┃ ┃ ┗ 📜 SettingViewModel.swift
 ┃ ┣ 📂 View
 ┃ ┃ ┣ 📜 LicenseView.swift
 ┃ ┃ ┣ 📜 NotificationView.swift
 ┃ ┃ ┗ 📜 SettingView.swift
 ┃ ┣ 📂 Model
 ┃ ┃ ┣ 📜 LicenseModel.swift
 ┃ ┃ ┗ 📜 SettingModel.swift
 ┣ 📂 Grass
 ┃ ┣ 📂 View
 ┃ ┃ ┗ 📜 CommitView.swift
 ┣ 📂 Todo
 ┃ ┣ 📂 View
 ┃ ┃ ┣ 📜 TodoView.swift
 ┃ ┃ ┗ 📜 TodoPreView.swift
 ┃ ┣ 📂 Model
 ┃ ┃ ┗ 📜 TodoModel.swift
 ┣ 📂 Progress
 ┃ ┣ 📂 View
 ┃ ┃ ┣ 📜 ProgressView.swift
 ┃ ┃ ┣ 📜 ModalView.swift
 ┃ ┃ ┣ 📜 ProgressBarView.swift
 ┃ ┃ ┣ 📜 DdayButtonView.swift
 ┃ ┃ ┗ 📜 ProgressTextView.swift
 ┣ 📂 Helper
 ┃ ┣ 📂 NotificationHelper
 ┃ ┃ ┗ 📜 LocalNotificationHelper.swift
 ┃ ┣ 📂 DarkLightMode
 ┃ ┃ ┣ 📜 DLMode.swift
 ┃ ┃ ┗ 📜 UIButton.swift
 ┃ ┣ 📂 Extensions
 ┃ ┃ ┣ 📜 fontExtension.swift
 ┃ ┃ ┣ 📜 CustomSpacing.swift
 ┃ ┃ ┣ 📜 colorExtension.swift
 ┃ ┃ ┗ 📜 DismissGesture.swift
 ┃ ┣ 📂 Fonts
 ┃ ┃ ┣ 📜 Pretendard-Black.otf
 ┃ ┃ ┣ 📜 Pretendard-Bold.otf
 ┃ ┃ ┣ 📜 Pretendard-ExtraBold.otf
 ┃ ┃ ┣ 📜 Pretendard-ExtraLight.otf
 ┃ ┃ ┣ 📜 Pretendard-Light.otf
 ┃ ┃ ┣ 📜 Pretendard-Medium.otf
 ┃ ┃ ┣ 📜 Pretendard-Regular.otf
 ┃ ┃ ┣ 📜 Pretendard-SemiBold.otf
 ┃ ┃ ┗ 📜 Pretendard-Thin.otf.swift
 ┣ 📜 CYCAPP.swift
 ┣ 📜 AppDelegate.swift
 ┣ 📜 StartView.swift
 ┗ 🖼️ Assets
```
