# Bremer Restaurant Booking App 🍽️📱

**Bremer** is a native iOS restaurant table booking application designed for a seamless user experience in Mansoura city. Built primarily with **UIKit**, the app leverages modern **SwiftUI** integration through **ActivityKit** and **WidgetKit** to implement advanced **Live Activities** and **Dynamic Island** support, allowing users to track their booking wait times in real-time right from their lock screen.

---

## ✨ Features

*   **Smart Table Reservation:** An intuitive flow that allows users to select their preferred table number and confirm their booking instantly.
*   **Live Activities & Dynamic Island:** Upon booking confirmation, a 1-hour live countdown timer is triggered. Users can seamlessly track their remaining wait time directly from the Dynamic Island or Lock Screen without opening the app.
*   **Deep Linking:** Interactive components within the Live Activity that smoothly transition the user from the Dynamic Island directly back into the application's booking success context.
*   **Performance & Battery Optimized:** Leverages system-driven SwiftUI text timers to prevent background processor overhead and maintain optimal battery efficiency.

---

## 🛠️ Tech Stack & Architecture

*   **Language:** Swift
*   **UI Frameworks:** UIKit (Main Application & Navigation) + SwiftUI (Widget & Live Activity Layouts)
*   **System Frameworks:** ActivityKit, WidgetKit
*   **Design Pattern:** MVC / MVVM
*   **Architecture Layout:** Multi-Target Architecture (Main App Target & Widget Extension Target)

---

## 🏗️ Technical Architecture Breakdown

The feature follows Apple's strict Human Interface Guidelines (HIG) by decoupling static layout properties from dynamic system updates to minimize memory overhead:

1.  **ActivityAttributes (`BookingAttributes`):**
    *   **Static Attributes:** Holds non-changing reservation details like the designated `tableNumber`.
    *   **ContentState (Dynamic Data):** Holds real-time mutating properties such as the calculated `endTime`.
2.  **WidgetBundle Entry Point:** Acts as the decentralized extension gateway, introducing the Live Activity structure into the subsystem independently of the application's main lifecycle thread.
3.  **UIKit Event Lifecycle Trigger:** Initiated directly from the UIKit `SuccessViewController`. It calls `ActivityKit` to request, generate, and host the runtime live instance with the initialized content parameters.

---

## 📸 Screenshots & Previews

| Dynamic Island (Compact) | Dynamic Island (Expanded) | Lock Screen Live Activity |
| :---: | :---: | :---: |
| `⏳` / `🍽️` | 🍽️ Bremer - Table Reservation | 🍽️ Bremer Restaurant - Countdown |

*(Note: Replace placeholders with screenshots from your Simulator to make the repository pop!)*

---

## 🚀 Installation & Requirements

*   **Xcode Version:** Xcode 15.0 or later
*   **iOS Version:** iOS 16.1+ (Minimum deployment target required for Live Activities) / iOS 17.0+ Recommended
*   **Setup Instructions:**
    1. Clone this repository locally.
    2. Open `Bremer.xcodeproj` in Xcode.
    3. Ensure both the main **Bremer** target and the **BremerWidgetExtension** target match your team profiles and share matching parent-child Bundle Identifiers (e.g., `yourname.com.Bremer` and `yourname.com.Bremer.BremerWidget`).
    4. Run the **Bremer** target on a device or simulator supporting Dynamic Island (e.g., iPhone 15 Pro, iPhone 16 Pro, or later).
