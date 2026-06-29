//
//  BremerWidgetLiveActivity.swift
//  BremerWidget
//
//  Created by ihab saad on 14/05/2026.
//

import WidgetKit
import SwiftUI

struct BremerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: BookingAttributes.self) { context in
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Bremer Restaurant 🍽️")
                            .font(.headline)
                            .foregroundColor(.orange)
                        Text("Table #\(context.attributes.tableNumber)")
                            .font(.subheadline)
                    }
                    Spacer()
                    Text(context.state.endTime, style: .timer)
                        .font(.title2)
                        .bold()
                        .monospacedDigit()
                        .foregroundColor(.red)
                }
            }
            .padding()

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("🍽️ Bremer")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.endTime, style: .timer)
                        .monospacedDigit()
                        .foregroundColor(.orange)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Your Table #\(context.attributes.tableNumber) is waiting!")
                }
            } compactLeading: {
                Text("🍽️")
            } compactTrailing: {
                Text(context.state.endTime, style: .timer)
                    .monospacedDigit()
                    .frame(width: 50)
            } minimal: {
                Text("⏳")
            }
        }
    }
}
