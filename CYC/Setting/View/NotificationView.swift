//
//  NotificationView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

struct NotificationView: View {
    
    @State var isOnNotification = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            self.presentationMode.wrappedValue.dismiss()
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
                })
                
                // MARK: - 알림 설정 상세 설명
                Text("오후 7시부터 12시까지 정각 시간마다 알림")
                    .font(.pretendardSemiBold_15)
                    .padding(.top, 15)
                Text("자정 전에 커밋을 하면 알람이 자동으로 종료됩니다")
                    .font(.pretendardSemiBold_15)
                    .padding(.top, 5)
                Text("알림시간 설정은 주인장 맘입니다.")
                    .font(.pretendardSemiBold_15)
                    .foregroundColor(Color.logoutColor)
                    .padding(.top, 5)
            }
            .padding(.horizontal)
            .offset(y: -265)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    NotificationView().preferredColorScheme(.dark)
}
