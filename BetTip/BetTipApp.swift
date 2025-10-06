import SwiftUI

@main
struct BetTipApp: App {
    let userManager = UserDefaultsManager.shared
    
    init() {
        let defaults = UserDefaults.standard
        let hasLaunchedKey = "hasLaunchedBefore"
        let firstLaunchDateKey = "firstLaunchDate"
        
        if !defaults.bool(forKey: hasLaunchedKey) {
            userManager.balance = 1000
            defaults.set(true, forKey: hasLaunchedKey)
            defaults.set(Date(), forKey: firstLaunchDateKey)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .onAppear {
                    let _ = userManager.balanceChangeSinceMonthStart()
                    userManager.checkAndUpdateWeeklyBalance()
                }
        }
    }
}
