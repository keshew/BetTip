import SwiftUI
import Charts

struct BankrollData: Identifiable, Codable {
    var id = UUID().uuidString
    var week: String
    var amount: Double
}

enum RecommendationType: Codable {
    case goodOpportunity
    case betSmaller
    case skipMatch
}

struct Recommendation: Identifiable, Codable {
    var id = UUID().uuidString
    let type: RecommendationType
    let title: String
    let description: String
    let iconName: String
}

struct BankRollManagerView: View {
    @StateObject var bankRollManagerModel =  BankRollManagerViewModel()
    let userManager = UserDefaultsManager.shared
    
    let displayedRecommendations: [Recommendation] = [
        Recommendation(type: .goodOpportunity,
                       title: "Good Opportunity",
                       description: "Liverpool vs Arsenal match shows strong value. Consider a balanced bet size.",
                       iconName: "checkmarkImg2"),
        Recommendation(type: .betSmaller,
                       title: "Bet Smaller",
                       description: "You've had 3 losses in a row. Consider reducing bet size by 25%.",
                       iconName: "warningImg"),
        Recommendation(type: .skipMatch,
                       title: "Skip This Match",
                       description: "High uncertainty in Chelsea vs Man City. Wait for better opportunities.",
                       iconName: "skip"),

        Recommendation(type: .goodOpportunity,
                       title: "Strong Odds",
                       description: "Real Madrid vs Barcelona offers attractive odds. Consider increasing your stake.",
                       iconName: "checkmarkImg2"),
        Recommendation(type: .betSmaller,
                       title: "Cautious Bet",
                       description: "Recent losses recommend smaller bets on this game to minimize risks.",
                       iconName: "warningImg"),
        Recommendation(type: .skipMatch,
                       title: "Hold Off",
                       description: "Unpredictable factors in Lakers vs Warriors. Better to skip this match.",
                       iconName: "skip"),

        Recommendation(type: .goodOpportunity,
                       title: "Value Bet",
                       description: "Man City vs Liverpool is a good chance for a profitable bet.",
                       iconName: "checkmarkImg2"),
        Recommendation(type: .betSmaller,
                       title: "Lower Your Stake",
                       description: "Consider lowering your bet size due to recent instability in outcomes.",
                       iconName: "warningImg"),
        Recommendation(type: .skipMatch,
                       title: "Skip Encounter",
                       description: "Too much uncertainty in the match. Wait for clearer signals.",
                       iconName: "skip"),

        Recommendation(type: .goodOpportunity,
                       title: "Smart Bet",
                       description: "Tottenham vs Everton shows promising statistics for a winning bet.",
                       iconName: "checkmarkImg2"),
        Recommendation(type: .betSmaller,
                       title: "Reduce Bet",
                       description: "Advised to reduce bet size after recent losing streak.",
                       iconName: "warningImg"),
        Recommendation(type: .skipMatch,
                       title: "Avoid Match",
                       description: "Consider avoiding this match due to unpredictable performance.",
                       iconName: "skip"),

        Recommendation(type: .goodOpportunity,
                       title: "High Confidence",
                       description: "Brighton vs Chelsea: strong statistical indicators support a bet.",
                       iconName: "checkmarkImg2"),
        Recommendation(type: .betSmaller,
                       title: "Small Wagers",
                       description: "Reduce your wager due to recent team inconsistencies.",
                       iconName: "warningImg"),
        Recommendation(type: .skipMatch,
                       title: "Pass This Game",
                       description: "Better to wait and skip the game due to unclear outcomes.",
                       iconName: "skip"),
    ]

    let bankrollPoints = UserDefaultsManager.shared.bankrollPoints
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Image(.onbImg)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("Bankroll Manager")
                            .FontRegular(size: 18)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                        .frame(height: 1)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color(red: 30/255, green: 41/255, blue: 59/255),
                                                          Color(red: 22/255, green: 26/255, blue: 42/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255))
                                    .overlay {
                                        VStack(spacing: 10) {
                                            Text("Current Bankroll")
                                                .FontRegular(size: 16)
                                            
                                            Text("$\(String(format: "%.2f", userManager.balance))")
                                                .FontRegular(size: 36)

                                            if let change = userManager.balanceChangeSinceMonthStart() {
                                                BalanceChangeView(percentChange: change.percentChange, amountChange: change.amountChange)
                                            } else {
                                                BalanceChangeView(percentChange: 0, amountChange: 0)
                                            }
                                            
                                            HStack {
                                                Spacer()
                                                VStack {
                                                    Text("Available")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Text("\(userManager.balance)")
                                                        .FontRegular(size: 16)
                                                }
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    Text("Losed")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    if let change = userManager.balanceChangeSinceMonthStart() {
                                                        Text("\(String(format: "%.2f", change.amountChange))$")
                                                            .FontRegular(size: 16, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                                                    } else {
                                                        Text("$0")
                                                            .FontRegular(size: 16, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                                                    }
                                                }
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    Text("Reserved")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Text("\(userManager.balance)")
                                                        .FontRegular(size: 16, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.top, 5)
                                        }
                                    }
                            }
                            .frame(height: 222)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                    .overlay {
                                        VStack(spacing: 18) {
                                            HStack {
                                                Text("Recommended Bet Sizing")
                                                    .FontRegular(size: 16)
                                                
                                                Spacer()
                                                
                                                Toggle("", isOn: $bankRollManagerModel.isOn)
                                                    .toggleStyle(CustomToggleStyle2())
                                            }
                                            
                                            Button(action: {
                                                if !bankRollManagerModel.isOn {
                                                    bankRollManagerModel.typeBet = .conservative
                                                    userManager.updateStrategy(to: .conservative)
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 15/255, green: 23/255, blue: 42/255))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color(red: 59/255, green: 130/255, blue: 246/255), lineWidth: bankRollManagerModel.typeBet == TypeBet.conservative ? 3 : 0)
                                                            .overlay {
                                                                HStack {
                                                                    Image(.conservative)
                                                                        .resizable()
                                                                        .frame(width: 32, height: 32)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("Conservative")
                                                                            .FontRegular(size: 14)
                                                                        
                                                                        Text("1-2% of bankroll")
                                                                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text("$28-57")
                                                                        .FontRegular(size: 16, color: Color(red: 21/255, green: 163/255, blue: 73/255))
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                    .frame(height: 60)
                                                    .cornerRadius(12)
                                            }
                                            
                                            Button(action: {
                                                if !bankRollManagerModel.isOn {
                                                    bankRollManagerModel.typeBet = .balanced
                                                    userManager.updateStrategy(to: .balanced)
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 15/255, green: 23/255, blue: 42/255))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color(red: 59/255, green: 130/255, blue: 246/255), lineWidth: bankRollManagerModel.isOn ? 3 : bankRollManagerModel.typeBet == TypeBet.balanced ? 3 : 0)
                                                            .overlay {
                                                                HStack {
                                                                    Image(.balanced)
                                                                        .resizable()
                                                                        .frame(width: 32, height: 32)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("Balanced")
                                                                            .FontRegular(size: 14)
                                                                        
                                                                        Text("2-3% of bankroll")
                                                                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text("$57-85")
                                                                        .FontRegular(size: 16, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                    .frame(height: 60)
                                                    .cornerRadius(12)
                                            }
                                            
                                            Button(action: {
                                                if !bankRollManagerModel.isOn {
                                                    bankRollManagerModel.typeBet = .agressive
                                                    userManager.updateStrategy(to: .aggressive)
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 15/255, green: 23/255, blue: 42/255))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color(red: 59/255, green: 130/255, blue: 246/255), lineWidth: bankRollManagerModel.typeBet == TypeBet.agressive ? 3 : 0)
                                                            .overlay {
                                                                HStack {
                                                                    Image(.aggressive)
                                                                        .resizable()
                                                                        .frame(width: 32, height: 32)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("Aggressive")
                                                                            .FontRegular(size: 14)
                                                                        
                                                                        Text("3-5% of bankroll")
                                                                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text("$85-142")
                                                                        .FontRegular(size: 16, color: Color(red: 248/255, green: 113/255, blue: 113/255))
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                    .frame(height: 60)
                                                    .cornerRadius(12)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 290)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        Rectangle()
                                .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                Text("Bankroll Growth")
                                                    .FontRegular(size: 16)
                                                    .padding(.leading)
                                                
                                                Spacer()
                                                
                                                Chart {
                                                    ForEach(bankrollPoints) { point in
                                                        LineMark(
                                                            x: .value("Week", point.week),
                                                            y: .value("Amount", point.amount)
                                                        )
                                                        .interpolationMethod(.linear)
                                                        PointMark(
                                                            x: .value("Week", point.week),
                                                            y: .value("Amount", point.amount)
                                                        )
                                                    }
                                                }
                                                .chartYAxis {
                                                    AxisMarks(position: .leading) { value in
                                                        AxisGridLine()
                                                        AxisTick()
                                                        AxisValueLabel() {
                                                            if let val = value.as(Int.self) {
                                                                Text("$\(val)")
                                                                    .FontRegular(size: 11, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                            } else if let val = value.as(Double.self) {
                                                                Text(String(format: "%.0f", val))
                                                            }
                                                        }
                                                    }
                                                }
                                                .chartXAxis {
                                                    AxisMarks(values: bankrollPoints.map { $0.week }) { value in
                                                        AxisGridLine()
                                                        AxisTick()
                                                        AxisValueLabel() {
                                                            if let week = value.as(String.self) {
                                                                Text(week)
                                                                    .FontRegular(size: 11, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                            }
                                                        }
                                                    }
                                                }
                                                .frame(height: 170)
                                                .padding(.horizontal, 16)
                                                .padding(.bottom, 16)
                                            }
                                            .padding(.vertical)
                                        }
                                }
                                .frame(height: 274)
                                .cornerRadius(14)
                                .padding(.horizontal)
                        
                        Rectangle()
                            .fill(LinearGradient(colors: [Color(red: 88/255, green: 28/255, blue: 135/255),
                                                          Color(red: 31/255, green: 58/255, blue: 138/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 126/255, green: 35/255, blue: 206/255), lineWidth: 3)
                                    .overlay {
                                        VStack(spacing: 15) {
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
                                            }

                                            VStack(spacing: 15) {
                                                let displayedRecommendations = Array(displayedRecommendations.shuffled().prefix(3))

                                                ForEach(displayedRecommendations) { recommendation in
                                                    RecommendationView(recommendation: recommendation)
                                                }
                                            }
                                            .cornerRadius(14)
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 416)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        Color.clear.frame(height: 60)
                    }
                    .padding(.top)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    BankRollManagerView()
}
