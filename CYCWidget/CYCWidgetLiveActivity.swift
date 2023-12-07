//
//  CYCWidgetLiveActivity.swift
//  CYCWidget
//
//  Created by 강치우 on 12/7/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CYCWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CYCWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CYCWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CYCWidgetAttributes {
    fileprivate static var preview: CYCWidgetAttributes {
        CYCWidgetAttributes(name: "World")
    }
}

extension CYCWidgetAttributes.ContentState {
    fileprivate static var smiley: CYCWidgetAttributes.ContentState {
        CYCWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CYCWidgetAttributes.ContentState {
         CYCWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CYCWidgetAttributes.preview) {
   CYCWidgetLiveActivity()
} contentStates: {
    CYCWidgetAttributes.ContentState.smiley
    CYCWidgetAttributes.ContentState.starEyes
}
