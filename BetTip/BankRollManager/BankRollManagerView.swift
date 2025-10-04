import SwiftUI
import Charts

struct BankrollData: Identifiable {
    let id = UUID()
    let week: String
    let amount: Double
}

struct BankRollManagerView: View {
    @StateObject var bankRollManagerModel =  BankRollManagerViewModel()
    
    let bankrollPoints = [
        BankrollData(week: "Week 1", amount: 2500),
        BankrollData(week: "Week 2", amount: 2600),
        BankrollData(week: "Week 3", amount: 2800),
        BankrollData(week: "Week 4", amount: 2900)
    ]
    
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
                                            
                                            Text("$2,847.50")
                                                .FontRegular(size: 36)
                                            
                                            HStack {
                                                Image(systemName: "arrow.up")
                                                    .foregroundStyle(Color(red: 74/255, green: 222/255, blue: 129/255))
                                                
                                                Text("+12.3% (+$315.20)")
                                                    .FontRegular(size: 16, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                
                                                Text("this month")
                                                    .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                            }
                                            
                                            HStack {
                                                Spacer()
                                                VStack {
                                                    Text("Available")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Text("$2,200.00")
                                                        .FontRegular(size: 16)
                                                }
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    Text("In Play")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Text("$647.50")
                                                        .FontRegular(size: 16, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                                                }
                                                
                                                Spacer()
                                                
                                                VStack {
                                                    Text("Reserved")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Text("$2,200.00")
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
                                            
                                            Rectangle()
                                                .fill(Color(red: 21/255, green: 83/255, blue: 45/255).opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 14)
                                                        .stroke(Color(red: 22/255, green: 128/255, blue: 61/255))
                                                        .overlay {
                                                            VStack(alignment: .leading) {
                                                                HStack {
                                                                    Image(.checkmarkImg2)
                                                                        .resizable()
                                                                        .frame(width: 16, height: 24)
                                                                    
                                                                    Text("Good Opportunity")
                                                                        .FontRegular(size: 14, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                                    
                                                                    Spacer()
                                                                }
                                                                
                                                                Text("Liverpool vs Arsenal match shows strong value. Consider a balanced bet size.")
                                                                    .FontRegular(size: 14)
                                                            }
                                                            .padding(.horizontal)
                                                        }
                                                }
                                                .frame(height: 98)
                                                .cornerRadius(14)
                                            
                                            Rectangle()
                                                .fill(Color(red: 113/255, green: 63/255, blue: 17/255).opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 14)
                                                        .stroke(Color(red: 162/255, green: 98/255, blue: 8/255))
                                                        .overlay {
                                                            VStack(alignment: .leading) {
                                                                HStack {
                                                                    Image(.warningImg)
                                                                        .resizable()
                                                                        .frame(width: 16, height: 24)
                                                                    
                                                                    Text("Bet Smaller")
                                                                        .FontRegular(size: 14, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                                                                    
                                                                    Spacer()
                                                                }
                                                                
                                                                Text("You've had 3 losses in a row. Consider reducing bet size by 25%.")
                                                                    .FontRegular(size: 14, color: Color(red: 255/255, green: 249/255, blue: 195/255))
                                                            }
                                                            .padding(.horizontal)
                                                        }
                                                }
                                                .frame(height: 98)
                                                .cornerRadius(14)
                                            
                                            Rectangle()
                                                .fill(Color(red: 126/255, green: 29/255, blue: 30/255).opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 14)
                                                        .stroke(Color(red: 185/255, green: 27/255, blue: 28/255))
                                                        .overlay {
                                                            VStack(alignment: .leading) {
                                                                HStack {
                                                                    Image(.skip)
                                                                        .resizable()
                                                                        .frame(width: 16, height: 24)
                                                                    
                                                                    Text("Skip This Match")
                                                                        .FontRegular(size: 14, color: Color(red: 248/255, green: 113/255, blue: 113/255))
                                                                    
                                                                    Spacer()
                                                                }
                                                                
                                                                Text("High uncertainty in Chelsea vs Man City. Wait for better opportunities.")
                                                                    .FontRegular(size: 14, color: Color(red: 254/255, green: 225/255, blue: 226/255))
                                                            }
                                                            .padding(.horizontal)
                                                        }
                                                }
                                                .frame(height: 98)
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
