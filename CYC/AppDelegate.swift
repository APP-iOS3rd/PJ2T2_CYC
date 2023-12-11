//
//  AppDelegate.swift
//  CYC
//
//  Created by 황민채 on 12/11/23.
//
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
        
        let triggerDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date())! // 예: 현재로부터 5분 후
        LocalNotificationHelper
            .shared
            .pushReservedNotification(title: "예약 알림입니다.",
                                      body: "예약 알림 테스트 중입니다.",
                                      date: triggerDate,
                                      identifier: "RESERVED_NOTI")
        LocalNotificationHelper
            .shared
            .pushScheduledNotification(title: "주기 알림입니다.",
                                       body: "주기 알림 테스트 중입니다.",
                                       hour: 22,
                                       identifier: "SCHEDULED_NOTI")
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Foreground(앱 켜진 상태)에서도 알림 오는 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
    }
}
