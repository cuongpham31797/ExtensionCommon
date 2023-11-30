//
//  UIApplication+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UIApplication {
    var keyFirstWindowActiveInactive: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
        // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
    var keyFirstWindowScene: UIWindowScene? {
        return UIApplication.shared.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })
    }
    
    static var appVersion: String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return "1.0.0"
        }
        return version
    }
}
