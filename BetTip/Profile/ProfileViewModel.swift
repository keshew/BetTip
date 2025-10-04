import SwiftUI

class ProfileViewModel: ObservableObject {
    let contact = ProfileModel()
    @Published var isOn: Bool {
        didSet {
            UserDefaults.standard.set(isOn, forKey: "isSoundOn")
        }
    }
    
    init() {
        self.isOn = UserDefaults.standard.bool(forKey: "isSoundOn")
    }
}
