import SwiftUI

struct CustomToggleStyle2: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color(red: 15/255, green: 23/255, blue: 42/255) : Color(red: 51/255, green: 65/255, blue: 84/255))
                .frame(width: 48, height: 24)
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? Color.white : Color(red: 59/255, green: 130/255, blue: 246/255))
                        .frame(width: 16, height: 16)
                        .offset(x: configuration.isOn ? 12 : -12)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct RecommendationView: View {
    let recommendation: Recommendation
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor(for: recommendation.type).opacity(0.5))
            .overlay {
                RoundedRectangle(cornerRadius: 14)
                    .stroke(borderColor(for: recommendation.type))
                    .overlay {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(recommendation.iconName)
                                    .resizable()
                                    .frame(width: 16, height: 24)
                                
                                Text(recommendation.title)
                                    .FontRegular(size: 14, color: textColor(for: recommendation.type))
                                
                                Spacer()
                            }
                            
                            Text(recommendation.description)
                                .FontRegular(size: 14, color: descriptionTextColor(for: recommendation.type))
                        }
                        .padding(.horizontal)
                    }
            }
            .frame(height: 98)
            .cornerRadius(14)
    }
    
    func backgroundColor(for type: RecommendationType) -> Color {
        switch type {
        case .goodOpportunity: return Color(red: 21/255, green: 83/255, blue: 45/255)
        case .betSmaller: return Color(red: 113/255, green: 63/255, blue: 17/255)
        case .skipMatch: return Color(red: 126/255, green: 29/255, blue: 30/255)
        }
    }
    
    func borderColor(for type: RecommendationType) -> Color {
        switch type {
        case .goodOpportunity: return Color(red: 22/255, green: 128/255, blue: 61/255)
        case .betSmaller: return Color(red: 162/255, green: 98/255, blue: 8/255)
        case .skipMatch: return Color(red: 185/255, green: 27/255, blue: 28/255)
        }
    }
    
    func textColor(for type: RecommendationType) -> Color {
        switch type {
        case .goodOpportunity: return Color(red: 74/255, green: 222/255, blue: 129/255)
        case .betSmaller: return Color(red: 250/255, green: 204/255, blue: 23/255)
        case .skipMatch: return Color(red: 248/255, green: 113/255, blue: 113/255)
        }
    }
    
    func descriptionTextColor(for type: RecommendationType) -> Color {
        switch type {
        case .goodOpportunity: return Color.white.opacity(0.9)
        case .betSmaller: return Color(red: 255/255, green: 249/255, blue: 195/255)
        case .skipMatch: return Color(red: 254/255, green: 225/255, blue: 226/255)
        }
    }
}

struct BalanceChangeView: View {
    let percentChange: Double
    let amountChange: Double
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: percentChange >= 0 ? "arrow.up" : "arrow.down")
                .foregroundStyle(percentChange >= 0 ? Color(red: 74/255, green: 222/255, blue: 129/255) : Color(red: 234/255, green: 88/255, blue: 88/255))
            
            Text("\(percentChange >= 0 ? "+" : "")\(String(format: "%.1f", percentChange))% (\(amountChange >= 0 ? "+" : "")\(String(format: "%.2f", amountChange))$)")
                .FontRegular(size: 16, color: percentChange >= 0 ? Color(red: 74/255, green: 222/255, blue: 129/255) : Color(red: 234/255, green: 88/255, blue: 88/255))
            
            Text("this month")
                .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
        }
    }
}

struct RecommendedBetSizingView: View {
    var userManager = UserDefaultsManager.shared
    let bankroll: Double = UserDefaultsManager.shared.balance
    
    var betPercentRange: String {
        switch userManager.strategy {
        case .conservative: return "1-2% of bankroll"
        case .balanced: return "2-3% of bankroll"
        case .aggressive: return "3-5% of bankroll"
        }
    }
    
    var betPercentValue: ClosedRange<Double> {
        switch userManager.strategy {
        case .conservative: return 0.01...0.02
        case .balanced: return 0.02...0.03
        case .aggressive: return 0.03...0.05
        }
    }
    
    var suggestedAmountRange: String {
        let minAmount = Int(bankroll * betPercentValue.lowerBound)
        let maxAmount = Int(bankroll * betPercentValue.upperBound)
        return "$\(minAmount)-\(maxAmount)"
    }
    
    var confidence: Int {
        switch userManager.strategy {
        case .conservative: return 3
        case .balanced: return 4
        case .aggressive: return 5
        }
    }
    
    var riskLevelText: String {
        switch userManager.strategy {
        case .conservative: return "Low"
        case .balanced: return "Medium"
        case .aggressive: return "High"
        }
    }
    
    var riskLevelColor: Color {
        switch userManager.strategy {
        case .conservative: return Color.green
        case .balanced: return Color.yellow
        case .aggressive: return Color.red
        }
    }
    
    var expectedReturn: String {
        let val = Double(Int(bankroll * betPercentValue.lowerBound)) * 1.5
        return "$\(Int(val))"
    }
    
    var kellyCriterion: String {
        switch userManager.strategy {
        case .conservative: return "2.0%"
        case .balanced: return "4.2%"
        case .aggressive: return "6.8%"
        }
    }
    
    var body: some View {
        VStack(spacing: 18) {
            HStack {
                Text("Recommended Bet Sizing")
                    .FontRegular(size: 16)
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 10) {
                HStack {
                    Image(.wallet)
                        .resizable()
                        .frame(width: 18, height: 18)
                    
                    Text("Recommended Bet Size")
                        .FontRegular(size: 18)
                        .padding(.leading, 5)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Based on your \(userManager.strategy.rawValue.capitalized) strategy")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        Text(betPercentRange)
                            .FontRegular(size: 24)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 5) {
                        Text("Suggested Amount")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        Text(suggestedAmountRange)
                            .FontRegular(size: 20, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 15)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Risk Level:")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        Spacer()
                        Text(riskLevelText)
                            .FontRegular(size: 14, color: riskLevelColor)
                    }
                    
                    HStack {
                        Text("Expected Return:")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        Spacer()
                        Text(expectedReturn)
                            .FontRegular(size: 14, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                    }
                    
                    HStack {
                        Text("Kelly Criterion:")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        Spacer()
                        Text(kellyCriterion)
                            .FontRegular(size: 14, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
