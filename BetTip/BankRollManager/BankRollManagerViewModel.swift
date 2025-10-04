import SwiftUI

enum TypeBet {
    case conservative
    case agressive
    case balanced
}
class BankRollManagerViewModel: ObservableObject {
    let contact = BankRollManagerModel()
    @Published var typeBet = TypeBet.balanced
    
    @Published var isOn: Bool {
        didSet {
            self.typeBet = .balanced
            UserDefaults.standard.set(isOn, forKey: "isBetOn")
        }
    }
    
    init() {
        self.isOn = UserDefaults.standard.bool(forKey: "isBetOn")
    }
}
