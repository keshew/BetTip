import Foundation

enum InvestmentStrategy: String {
    case conservative
    case balanced
    case aggressive
}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let balanceKey = "userBalance"
    private let strategyKey = "investmentStrategy"
    private let monthlyHistoryKeyPrefix = "monthlyBalanceHistory_" 
    private let bankrollPointsKey = "bankrollPoints"
    
    private let calendar = Calendar.current
    
    private init() {}
    
    var balance: Double {
        get {
            UserDefaults.standard.double(forKey: balanceKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: balanceKey)
        }
    }
    
    var strategy: InvestmentStrategy {
        get {
            if let raw = UserDefaults.standard.string(forKey: strategyKey),
               let strat = InvestmentStrategy(rawValue: raw) {
                return strat
            }
            return .balanced
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: strategyKey)
        }
    }
    
    func addToBalance(amount: Double) {
        let newBalance = balance + amount
        balance = newBalance
        saveMonthlyBalanceSnapshot(newBalance)
    }
    
    func subtractFromBalance(amount: Double) {
        let newBalance = balance - amount
        balance = newBalance
        saveMonthlyBalanceSnapshot(newBalance)
    }
    
    private func saveMonthlyBalanceSnapshot(_ amount: Double) {
        let monthKey = keyForCurrentMonth()
        
        if UserDefaults.standard.object(forKey: monthKey) == nil {
            UserDefaults.standard.set(amount, forKey: monthKey)
        }
    }
    
    func balanceChangeSinceMonthStart() -> (percentChange: Double, amountChange: Double)? {
        let monthKey = keyForCurrentMonth()
        let currentBalance = balance
        
        guard UserDefaults.standard.object(forKey: monthKey) != nil else {
            return nil
        }
        
        let startBalance = UserDefaults.standard.double(forKey: monthKey)
        if startBalance == 0 {
            return nil
        }
        
        let changeAmount = currentBalance - startBalance
        let percentChange = (changeAmount / startBalance) * 100
        return (percentChange, changeAmount)
    }
    
    private func keyForCurrentMonth() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        let monthString = formatter.string(from: date)
        return monthlyHistoryKeyPrefix + monthString
    }
    
    var bankrollPoints: [BankrollData] {
        get {
            guard let data = UserDefaults.standard.data(forKey: bankrollPointsKey),
                  let points = try? JSONDecoder().decode([BankrollData].self, from: data) else {
                return [
                    BankrollData(week: "Week 1", amount: 0),
                    BankrollData(week: "Week 2", amount: 0),
                    BankrollData(week: "Week 3", amount: 0),
                    BankrollData(week: "Week 4", amount: 0)
                ]
            }
            return points
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: bankrollPointsKey)
            }
        }
    }
    
    func updateStrategy(to newStrategy: InvestmentStrategy) {
        strategy = newStrategy
    }
    
    func updateBankrollPoint(week: String, newAmount: Double) {
        var points = bankrollPoints
        if let index = points.firstIndex(where: { $0.week == week }) {
            points[index].amount = newAmount
        } else {
            points.append(BankrollData(week: week, amount: newAmount))
        }
        bankrollPoints = points
    }
    
    func checkAndUpdateWeeklyBalance() {
        let defaults = UserDefaults.standard
        let lastUpdate = defaults.object(forKey: "lastWeeklyUpdateDate") as? Date ?? Date.distantPast
        let now = Date()
        let calendar = Calendar.current

        let lastMonth = calendar.component(.month, from: lastUpdate)
        let nowMonth = calendar.component(.month, from: now)
        let lastYear = calendar.component(.year, from: lastUpdate)
        let nowYear = calendar.component(.year, from: now)

        if nowYear != lastYear || nowMonth != lastMonth {
            bankrollPoints = [
                BankrollData(week: "Week 1", amount: 0),
                BankrollData(week: "Week 2", amount: 0),
                BankrollData(week: "Week 3", amount: 0),
                BankrollData(week: "Week 4", amount: 0)
            ]
            defaults.set(nil, forKey: "lastWeeklyUpdateDate")
        }

        let daysSinceUpdate = calendar.dateComponents([.day], from: lastUpdate, to: now).day ?? 0

        if daysSinceUpdate >= 7 {
            let weekNum = currentWeekOfMonth()
            let weekName = "Week \(weekNum)"

            updateBankrollPointStrict(week: weekName, newAmount: balance)
            defaults.set(now, forKey: "lastWeeklyUpdateDate")
        }
    }

    func currentWeekOfMonth() -> Int {
        let calendar = Calendar.current
        let now = Date()

        guard let _ = calendar.date(from: calendar.dateComponents([.year, .month], from: now)) else {
            return 1
        }

        let dayOfMonth = calendar.component(.day, from: now)
        let weekNumber = (dayOfMonth - 1) / 7 + 1
        return min(4, max(1, weekNumber))
    }

    func updateBankrollPointStrict(week: String, newAmount: Double) {
        var points = bankrollPoints
        if let index = points.firstIndex(where: { $0.week == week }) {
            points[index].amount = newAmount
            bankrollPoints = points
        }
    }
}
