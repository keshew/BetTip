import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var savedBets: [HomePredictionModel] = []

    init() {
        loadSavedBets()
    }

    func loadSavedBets() {
        guard let data = UserDefaults.standard.data(forKey: "savedBets") else {
            savedBets = []
            return
        }
        if let decoded = try? JSONDecoder().decode([HomePredictionModel].self, from: data) {
            savedBets = decoded
        } else {
            savedBets = []
        }
    }
    
    var totalBets: Int {
         savedBets.count
     }

     var winRate: Double {
         guard totalBets > 0 else { return 0 }
         let wins = savedBets.filter { $0.isWon == true }.count
         return (Double(wins) / Double(totalBets)) * 100
     }

     var netProfit: Double {
         savedBets.reduce(0.0) { total, bet in
             let betAmount = Double(bet.bet) ?? 0.0
             let coefficient = Double(bet.coofiecient) ?? 0.0
             let profit = (coefficient * betAmount - betAmount)
             // Учитываем проигрыш как отрицательную прибыль
             if bet.isWon == true {
                 return total + profit
             } else if bet.isWon == false {
                 return total - betAmount
             } else {
                 return total
             }
         }
     }
}
