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
        
        let notiTime = Array<Int>(19...23)
        let notiMessage: [String] = ["성공하면 커밋 실패하면 반역", "치우랑 사귈래 커밋할래", "커밋만 치고 푸시 안하신건 아니죠?", "커밋해줘여..🫶", "너도 할 수 있어 '커밋'", "결혼에 대하여 예쁜 커밋을 골라~", "커밋은 돌아오는거야!", "나랑 사귈래 커밋할래", "아는 형님의 ~ 아는 누나의 커밋이요!", "너는 별을 보자며 내 커밋 치고서", "커밋이 매깨고", "커밋 묻고 떠블로가", "커밋 푸쉬빼고 모조리 다 씹어먹어줄게..", "연진아, 내 커밋은 너야", "커밋, I am 신뢰에요", "중요한건 꺾여도 그냥 하는 커밋", "너의 커밋을 누르고 설레임에 푸쉬 누르다..", "하염없이 기다리는 중..", "오늘안에 커밋 하시는거죠?", "커밋하고 성공시대 시작됐다! C Y C!", "언제 커밋하시려고요?", "야이 개땍기야 레포로 따라와", "아ㅋㅋ 그거 그렇게 커밋치는거 아닌데ㅋㅋ"]
        
        if isOnNotification {
            print("on")
            LocalNotificationHelper.shared.printPendingNotification()
            for i in notiTime {
                LocalNotificationHelper
                    .shared
                    .pushScheduledNotification(title: "Check Your Commit",
                                               body: notiMessage.randomElement()!,
                                               hour: i,
                                               identifier: "SCHEDULED_NOTI\(i)")
            }
        } else {
            print("off")
            LocalNotificationHelper.shared.printPendingNotification()
            LocalNotificationHelper.shared.removeAllNotifications()
            LocalNotificationHelper.shared.printPendingNotification()
        }
    }
}

#Preview {
    NotificationView().preferredColorScheme(.dark)
}




