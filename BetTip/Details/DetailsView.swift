import SwiftUI

struct DetailsView: View {
    @StateObject var detailsModel =  DetailsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var model: HomePredictionModel
    @State private var selectedMatchResult: String? = "1"
    @State private var selectedBet: HomePredictionModel? = nil
    @State var showAlert = false
    @State var showAlertMoney = false
//    @State private var selectedTotalGoals: String? = nil
//    @State private var selectedBothScore: String? = nil
//    @State private var selectedAsianHandcap: String? = nil
    
    func saveSelectedBet() {
        guard let selectedBet = selectedBet else { return }

        var savedBets: [HomePredictionModel] = []
        if let data = UserDefaults.standard.data(forKey: "savedBets") {
            if let decoded = try? JSONDecoder().decode([HomePredictionModel].self, from: data) {
                savedBets = decoded
            }
        }
        
        savedBets.append(selectedBet)

        if let encoded = try? JSONEncoder().encode(savedBets) {
            UserDefaults.standard.set(encoded, forKey: "savedBets")
        }
    }
    
    var selectedBetDetails: (betText: String, coofiecient: String) {
        switch selectedMatchResult {
            case "1":
                return ("1", "1.65")
            case "2":
                return ("X", "3.20")
            case "3":
                return ("2", "5.50")
            case "4":
                return ("Over 2.5", "1.85")
            case "5":
                return ("Under 2.5", "1.95")
            case "6":
                return ("Yes", "1.70")
            case "7":
                return ("No", "2.10")
            case "8":
                return ("\(model.firstTeamName) 0.0", "1.92")
            case "9":
                return ("\(model.secondTeamName) 0.0", "1.88")
            default:
                return ("", "")
        }
    }

    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
                
                Color(red: 16/255, green: 24/255, blue: 43/255).ignoresSafeArea(edges: .top)
                    .frame(height: 60)
            }
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.white)
                                .frame(width: 15, height: 15)
                        }
                        
                        Spacer()
                        
                        Text("Match Details")
                            .FontRegular(size: 18)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.clear)
                            .frame(width: 15, height: 15)
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        Text(model.nameLeague)
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        Text(model.dateTime)
                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                                Image(model.firstTeamImage)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                
                                Text(model.firstTeamName)
                                    .FontRegular(size: 14)
                                
                                Text("Home")
                                    .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("VS")
                                    .FontRegular(size: 24)
                                
                                Text("Match 1247")
                                    .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image(model.secondTeamImage)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                
                                Text(model.secondTeamName)
                                    .FontRegular(size: 14)
                                
                                Text("Away")
                                    .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                            }
                            Spacer()
                        }
                        
                        Rectangle()
                            .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                            .frame(height: 1)
                    }
                    .padding(.top, 5)
                    
                    Rectangle()
                        .fill(LinearGradient(colors: [Color(red: 88/255, green: 28/255, blue: 135/255),
                                                      Color(red: 31/255, green: 58/255, blue: 138/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 126/255, green: 35/255, blue: 206/255), lineWidth: 3)
                                .overlay {
                                    VStack(alignment: .leading, spacing: 15) {
                                        HStack {
                                            Image(.airec)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            VStack(alignment: .leading) {
                                                Text("AI Recommendations")
                                                    .FontRegular(size: 16)
                                                
                                                Text("Smart insights for better decisions")
                                                    .FontRegular(size: 12, color: Color(red: 234/255, green: 213/255, blue: 255/255))
                                            }
                                            .padding(.leading, 5)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Circle()
                                                    .fill(Color(red: 31/255, green: 125/255, blue: 77/255))
                                                    .frame(width: 8, height: 8)
                                                
                                                Text("Live")
                                                    .FontRegular(size: 14, color: Color(red: 76/255, green: 222/255, blue: 129/255))
                                            }
                                        }
                                        
                                        Rectangle()
                                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255).opacity(0.5))
                                            .overlay {
                                                VStack(spacing: 10) {
                                                    Text("\(model.firstTeamName) Win")
                                                        .FontRegular(size: 18)
                                                    
                                                    Text(model.confidence)
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                }
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 98)
                                            .cornerRadius(14)
                                        
                                        Text("Based on recent form, head-to-head records, and player availability. Home advantage and current league position favor \(model.firstTeamName)")
                                            .FontRegular(size: 14)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        .frame(height: 252)
                        .cornerRadius(14)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    HStack {
                        Image(.coinsImg)
                            .resizable()
                            .frame(width: 18, height: 18)
                        
                        Text("Betting Options")
                            .FontRegular(size: 18)
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("Match Result")
                                                    .FontRegular(size: 14)
                                                
                                                Spacer()
                                                
                                                Rectangle()
                                                    .fill(Color(red: 31/255, green: 72/255, blue: 66/255))
                                                    .overlay {
                                                        Text("Recommended")
                                                            .FontRegular(size: 12, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                    }
                                                    .frame(width: 85, height: 24)
                                                    .cornerRadius(8)
                                            }
                                            
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    selectedMatchResult = "1"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "1" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("1")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.65")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    selectedMatchResult = "2"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "2" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("X")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("3.20")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    selectedMatchResult = "3"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "3" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("2")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("5.50")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 128)
                            .cornerRadius(14)
                        
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("Total Goals")
                                                    .FontRegular(size: 14)
                                                
                                                Spacer()
                                                
                                                Text("O/U 2.5")
                                                    .FontRegular(size: 12, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                            }
                                            
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    selectedMatchResult = "4"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "4" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("Over 2.5")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.85")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    selectedMatchResult = "5"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "5" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("Under 2.5")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.95")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 128)
                            .cornerRadius(14)
                        
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("Both Teams to Score")
                                                    .FontRegular(size: 14)
                                                
                                                Spacer()
                                                
                                                Rectangle()
                                                    .fill(Color(red: 71/255, green: 69/255, blue: 49/255))
                                                    .overlay {
                                                        Text("Good Value")
                                                            .FontRegular(size: 12, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                                                    }
                                                    .frame(width: 68, height: 24)
                                                    .cornerRadius(8)
                                            }
                                            
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    selectedMatchResult = "6"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "6" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("Yes")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.70")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    selectedMatchResult = "7"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "7" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("No")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("2.10")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 128)
                            .cornerRadius(14)
                        
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("Asian Handicap")
                                                    .FontRegular(size: 14)
                                                
                                                Spacer()
                                                
                                                Text("0.0")
                                                    .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                            }
                                            
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    selectedMatchResult = "8"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "8" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("\(model.firstTeamName) 0.0")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.92")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    selectedMatchResult = "9"
                                                }) {
                                                    Rectangle()
                                                        .fill(selectedMatchResult == "9" ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("\(model.secondTeamName) 0.0")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.88")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 128)
                            .cornerRadius(14)
                    }
                    .padding(.horizontal)
                    
                    Rectangle()
                        .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                        .frame(height: 1)
                        .padding(.top, 40)
                    
                    RecommendedBetSizingView()
                        .padding(.top, 15)
                    
                    Button(action: {
                        let userManager = UserDefaultsManager.shared
                        let bankroll = userManager.balance
                        let betText = selectedBetDetails.betText
                        let coofiecient = selectedBetDetails.coofiecient
                        let betPercentValue: ClosedRange<Double> = {
                            switch userManager.strategy {
                            case .conservative: return 0.01...0.02
                            case .balanced: return 0.02...0.03
                            case .aggressive: return 0.03...0.05
                            }
                        }()
                        
                        let betAmount = bankroll * betPercentValue.upperBound
                        let betString = String(format: "%.2f", betAmount)
                        
                        if betAmount <= userManager.balance {
                            userManager.subtractFromBalance(amount: betAmount)
                            
                            selectedBet = HomePredictionModel(
                                id: model.id,
                                nameLeague: model.nameLeague,
                                imageLeague: model.imageLeague,
                                dateTime: model.dateTime,
                                firstTeamName: model.firstTeamName,
                                firstTeamImage: model.firstTeamImage,
                                secondTeamName: model.secondTeamName,
                                secondTeamImage: model.secondTeamImage,
                                aiPrediction: model.aiPrediction,
                                betText: betText,
                                coofiecient: coofiecient,
                                confidence: model.confidence,
                                bet: betString
                            )
                            
                            saveSelectedBet()
                        } else {
                            showAlertMoney = true
                        }
                        scheduleOutcomeUpdate(for: model.id)
                        showAlert = true
                    }) {
                        Rectangle()
                            .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                            .overlay {
                                Text("Bet")
                                    .FontRegular(size: 24)
                            }
                            .frame(width: 250, height: 60)
                            .cornerRadius(8)
                    }
                    .padding(.top, 15)
                    .alert("Succsessful", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("Bet succsessful")
                        }
                        .alert("Failed", isPresented: $showAlertMoney) {
                                Button("OK", role: .cancel) { }
                            } message: {
                                Text("Not enough money to bet")
                            }
                }
                .padding(.top, 5)
            }
            .padding(.top)
        }
    }
    
    func scheduleOutcomeUpdate(for betId: String) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 10) {
            var savedBets: [HomePredictionModel] = []
            let userManager = UserDefaultsManager.shared
            
            if let data = UserDefaults.standard.data(forKey: "savedBets"),
               let decoded = try? JSONDecoder().decode([HomePredictionModel].self, from: data) {
                savedBets = decoded
            }

            if let index = savedBets.firstIndex(where: { $0.id == betId }) {
                let chanceToWin = 0.7
                savedBets[index].isWon = Double.random(in: 0..<1) < chanceToWin

                if savedBets[index].isWon == true {
                    let betAmount = Double(savedBets[index].bet) ?? 0.0
                    let coefficient = Double(savedBets[index].coofiecient) ?? 0.0
                    let winnings = betAmount * coefficient
                    userManager.addToBalance(amount: winnings + betAmount)
                } else if savedBets[index].isWon == false {
                }

                if let encoded = try? JSONEncoder().encode(savedBets) {
                    UserDefaults.standard.set(encoded, forKey: "savedBets")
                }
            }
        }
    }
}

#Preview {
    DetailsView(model: .constant(HomePredictionModel(nameLeague: "NBA",
                                                     imageLeague: "nba",
                                                     dateTime: "Tomorrow, 02:30",
                                                     firstTeamName: "Lakers",
                                                     firstTeamImage: "lakers",
                                                     secondTeamName: "Warriors",
                                                     secondTeamImage: "warriors",
                                                     aiPrediction: "50%",
                                                     betText: "Warriors Win",
                                                     coofiecient: "1.95",
                                                     confidence: "Medium confidence")))
}
