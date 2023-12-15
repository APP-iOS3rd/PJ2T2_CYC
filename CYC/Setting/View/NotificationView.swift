//
//  NotificationView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

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

struct NotificationView: View {
    
    @AppStorage("notification") var isOnNotification: Bool = UserDefaults.standard.bool(forKey: "notification")
    @Environment(\.dismiss) var dismiss
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.base)
                    .bold()
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                Toggle(isOn: $isOnNotification, label: {
                    
                    // MARK: - 알림 설정 토글
                    Text("알림 설정")
                        .font(.pretendardBold_25)
                }).onChange(of: isOnNotification, initial: false, techNotification)
                
                VStack(alignment: .leading, spacing: 8) {
                    // MARK: - 알림 설정 상세 설명
                    Text("오후 7시부터 12시까지 정각 시간마다 알림")
                        .font(.pretendardSemiBold_15)
                        .padding(.top, 15)
                    Text("자정 전에 커밋을 하면 알람이 자동으로 종료됩니다")
                        .font(.pretendardSemiBold_15)
                    Text("알림시간 설정은 주인장 맘입니다.")
                        .font(.pretendardSemiBold_15)
                        .foregroundColor(Color.logoutColor)
                }
                .vSpacing(.topLeading)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .DismissGesture()
    }
    
    func techNotification() {
        let triggerDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date())! // 예: 현재로부터 1분 후
        
        if isOnNotification {
            LocalNotificationHelper.shared.printPendingNotification()
            
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "커밋해줘여..🫶",
                                           hour: 18,
                                           identifier: "SCHEDULED_NOTI18")
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "커밋만 치고 푸시 안하신건 아니죠?",
                                           hour: 19,
                                           identifier: "SCHEDULED_NOTI19")
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "커밋하고 성공시대 시작됐다. 에 듀 윌 !",
                                           hour: 20,
                                           identifier: "SCHEDULED_NOTI20")
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "너의 커밋을 누르고..설레임에 푸쉬 누르다..",
                                           hour: 21,
                                           identifier: "SCHEDULED_NOTI21")
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "치우랑 사귈래 커밋할래",
                                           hour: 22,
                                           identifier: "SCHEDULED_NOTI22")
            LocalNotificationHelper
                .shared
                .pushScheduledNotification(title: "Check Your Commit",
                                           body: "성공하면 커밋 실패하면 반역",
                                           hour: 23,
                                           identifier: "SCHEDULED_NOTI23")
        } else {
            LocalNotificationHelper.shared.printPendingNotification()
            LocalNotificationHelper.shared.removeAllNotifications()
            print("팬딩중인 알림:")
            LocalNotificationHelper.shared.printPendingNotification()
        }
    }
}

#Preview {
    NotificationView().preferredColorScheme(.dark)
}



