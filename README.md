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
|<img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/fca4d518-9f9b-4f7e-a72f-fa45129843ef" width="300">|<img src="https://github.com/APP-iOS3rd/PJ2T2_CYC/assets/120264964/17639f09-f73f-4de2-97b9-607e01b44148" width="300">|

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

### Step3

<details>
<summary>FCM에서 userNotifications로 전환한 이유</summary>

처음 구현하고자 했던 기능의 순서는 다음과 같았다.

> 1. `APNs`에 디바이스 `토큰`을 요청
> 2. `APNs`에서 받은 디바이스 `토큰`을 `Push server`에 넘김
> 3. `APNs`에 푸쉬알림을 보낼 데이터를 전달
> 4. `APNs`에 있는 데이터를 받아서 유저의 폰에서 알림 전달

```Swift
import SwiftUI
import FirebaseCore
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        // 원격 알림 등록
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()

        // Firebase 가 푸시 메시지를 대신 전송할 수 있도록 대리자를 설정하는 과정 (MessagingDelegate)
        Messaging.messaging().delegate = self


        // 푸시 포그라운드 설정
        UNUserNotificationCenter.current().delegate = self

        return true
        //Messaging에 등록된 토큰은 messaging:didReceiveRegistrationToken 프로토콜 메서드를 1회 호출함 - 새로 등록된 토큰이라면 애플리케이션 서버로 전송/ 아니라면 등록된 토큰을 구독 처리해줌
    }


    // fcm 토큰이 등록 되었을 때
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}

@main
struct CYCApp: App {
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            AboutCYC()
        }
    }
}
extension AppDelegate : MessagingDelegate {

    // fcm 등록 토큰을 받았을 때
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }
}

extension AppDelegate : UNUserNotificationCenterDelegate {

    // 푸시메세지가 앱이 켜져 있을때 나올때
    // completionHandler로 "UNNotificationPresentationOptions"를 반환함
    // 사용자가 머무르고 있는 화면에 따라 포그라운드 상태에서의 푸시를 보여줄지 아닐지에 대한 분기처리가 가능(ex.카톡채팅방에서 푸시를 띄우지 않는 등)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        let userInfo = notification.request.content.userInfo

        print("willPresent: userInfo: ", userInfo)

        completionHandler([.banner, .sound, .badge])

        // Notification 분기처리
        if userInfo[AnyHashable("Check Your Commit")] as? String == "project" {
            print("CYC project")
        }else {
            print("NOTHING")
        }
    }

    // 푸시메세지를 받았을 때
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("didReceive: userInfo: ", userInfo)
        completionHandler()
    }
}
```

위 코드로 토큰을 받아 수동으로 Firebase messiging 서버에 직접 등록하고 앱에 알림을 받는데에 성공했다.하지만 문제는 다수 유저의 토큰을 어떻게 받아서 메시징 서버에 올려주느냐였다. 서버없이 FCM만 사용하여 다음 두 조건을 동시에 만족하는 유저에게만 알림을 줄 수 있는 방법을 생각하여야 했다.
> - 사용자가 일정 시간에 커밋하였는가
> - 사용자가 알림 설정 토글을 on 하였는가

사용자의 정보를 서버가 저장하고 있어야 위 두 조건을 만족하는 기능을 구현할 수 있다고 결론을 내렸고, 이번 개발 기간에는 `사용자가 알림 설정 토글을 on 하였을 때` 7시 이후 매 시간마다 알림을 주는 기능만을 구현하기로 하였다. 이 기능을 구현하는데에 FCM을 굳이 사용하지 않고 내부 라이브러리인 userNotifications 을 사용하였다. 

- `AppDelegate.swift`
```Swift
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 앱 실행 시 사용자에게 알림 허용 권한을 받음
        UNUserNotificationCenter.current().delegate = self
        
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound] // 필요한 알림 권한을 설정
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Foreground(앱 켜진 상태)에서도 알림 오는 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
    }
}
```
앱델리게이트에서 알림권한을 설정해주었다.
- `NotificationHelper.swift`
```swift
import Foundation
import UIKit
import UserNotifications

//
// - Note: 싱글턴으로 구현 `LocalNotificationHelper.shared`를 통해 접근
class LocalNotificationHelper {
    static let shared = LocalNotificationHelper()
    
    private init() {}
    
    ///Push Notification에 대한 인증 설정 함수
    func setAuthorization() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound] // 필요한 알림 권한을 설정
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
    }
    // 하루를 주기로 특정 시간에 Notification을 보내는 코드
    func pushScheduledNotification(title: String, body: String, hour: Int, identifier: String) {
        
        assert(hour >= 0 || hour <= 24, "시간은 0이상 24이하로 입력해주세요.")
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour  // 알림을 보낼 시간 (24시간 형식)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier,
                                            content: notificationContent,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    /// 대기중인 Push Notification을 출력
    func printPendingNotification() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            for request in requests {
                print("Identifier: \(request.identifier)")
                print("Title: \(request.content.title)")
                print("Body: \(request.content.body)")
                print("Trigger: \(String(describing: request.trigger))")
                print("---")
            }
        }
    }
    //알림 전체삭제
    func removeAllNotifications() {
        UNUserNotificationCenter
            .current().removeAllDeliveredNotifications()
        UNUserNotificationCenter
            .current().removeAllPendingNotificationRequests()
    }
}
```
NotificationHelper 클래스에서 알림에 필요한 함수를 구현하였다.
- `NotificationView`
```swift
class NotificationSettings: ObservableObject {
    @Published var isOnNotification: Bool {
        didSet {
            UserDefaults.standard.set(isOnNotification, forKey: "isOnNotification")
        }
    }
    
    init() {
        self.isOnNotification = UserDefaults.standard.bool(forKey: "isOnNotification")
    }
}
.
.
VStack(alignment: .leading) {
    Toggle(isOn: $isOnNotification, label: {
        
        // MARK: - 알림 설정 토글
        Text("알림 설정")
            .font(.pretendardBold_25)
    }).onChange(of: isOnNotification, initial: false, techNotification)
.
.
func techNotification() {
    if isOnNotification {
      LocalNotificationHelper.shared.printPendingNotification()
      LocalNotificationHelper
        .shared
        .pushScheduledNotification(title: "Check Your Commit",
                                   body: "커밋해줘여..🫶",
                                   hour: 18,
                                   identifier: "SCHEDULED_NOTI18")
    } else if {
        LocalNotificationHelper.shared.removeAllNotifications()
    }
}
.
.
```
알림 설정뷰에서 토글값이 on일 때 알림이 알림센터에 올라가도록 구현하고, off 시엔 알림센터의 알림을 모두 삭제하도록 구현하였다. 
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
