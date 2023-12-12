//
//  CYCApp.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI
import SwiftData
import UserNotifications


@main
struct CYCApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate //AppDelegate 생성하고 @main 에 연결
    
    // MARK: - SwiftData 컨테이너
    var sharedModelContainer: ModelContainer = {
        do {
            let schema = Schema([
                TodoModel.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
        .modelContainer(sharedModelContainer)
    }
}


// MARK: - 화면 터치시 키보드 내려감

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}


