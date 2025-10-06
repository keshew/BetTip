import SwiftUI

struct HistoryView: View {
    @StateObject var historyModel =  HistoryViewModel()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Image(.onbImg)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("Betting History")
                            .FontRegular(size: 18)
                    }
                    
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                            .frame(height: 1)
                        
                        ZStack {
                            LinearGradient(colors: [Color(red: 30/255, green: 41/255, blue: 59/255),
                                                    Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing)
                            
                            HStack {
                                Spacer()

                                VStack {
                                    Text(String(format: "%.1f%%", historyModel.winRate))
                                        .FontRegular(size: 24, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                    Text("Win Rate")
                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                }

                                Spacer()

                                VStack {
                                    Text("\(historyModel.totalBets)")
                                        .FontRegular(size: 24, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                    Text("Total Bets")
                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                }

                                Spacer()

                                VStack {
                                    Text(String(format: "%.2f$", historyModel.netProfit))
                                        .FontRegular(size: 24, color: Color(red: 192/255, green: 132/255, blue: 252/255))
                                    Text("Net Profit")
                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                }

                                Spacer()
                            }
                        }
                        .frame(height: 96)
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        if historyModel.savedBets.isEmpty {
                            Text("No history yet!")
                                .FontRegular(size: 16, color: .gray)
                                .padding()
                        } else {
                            ForEach(historyModel.savedBets) { bet in
                                Rectangle()
                                    .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                            .overlay {
                                                VStack(spacing: 15) {
                                                    HStack {
                                                        Image(bet.nameLeague == "La Liga" ? "laliga2" : (bet.nameLeague == "NBA" ? "nba2" : "premier2"))
                                                            .resizable()
                                                            .frame(width: 40, height: 40)
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("\(bet.firstTeamName) vs \(bet.secondTeamName)")
                                                                .FontRegular(size: 14)
                                                            
                                                            Text("\(bet.nameLeague) • \(dateFormatter.string(from: bet.date))")
                                                                .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        Rectangle()
                                                            .fill(bet.isWon == nil ? Color(red: 234/255, green: 180/255, blue: 5/255) : (bet.isWon! ? Color(red: 33/255, green: 197/255, blue: 93/255) : Color(red: 239/255, green: 68/255, blue: 68/255)))
                                                            .overlay {
                                                                HStack(spacing: 4) {
                                                                    Image(systemName: bet.isWon == nil ? "clock" : (bet.isWon! ? "checkmark" : "xmark"))
                                                                        .foregroundStyle(bet.isWon == nil ? .black : .white)
                                                                        .font(.system(size: 12))
                                                                    
                                                                    Text(bet.isWon == nil ? "Pending" : (bet.isWon! ? "Win" : "Lose"))
                                                                        .FontRegular(size:  bet.isWon == nil ? 10 : 12, color: bet.isWon == nil ? .black : .white)
                                                                }
                                                            }
                                                            .frame(width: bet.isWon == nil ? 61 : 51, height: 24)
                                                            .cornerRadius(20)
                                                    }
                                                    
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack(spacing: 10) {
                                                                HStack {
                                                                    Text("Prediction")
                                                                        .FontRegular(size: 14, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text(bet.betText)
                                                                        .FontRegular(size: 16)
                                                                }
                                                                
                                                                HStack {
                                                                    Text("Odds")
                                                                        .FontRegular(size: 14, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text(bet.coofiecient)
                                                                        .FontRegular(size: 16, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                                                }
                                                                
                                                                HStack {
                                                                    Text("Bet Amount")
                                                                        .FontRegular(size: 14, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text(bet.bet)
                                                                        .FontRegular(size: 16)
                                                                }
                                                            }
                                                            .padding(.horizontal)
                                                        }
                                                        .frame(height: 112)
                                                        .cornerRadius(14)
                                                    
                                                    HStack {
                                                        let betAmount = Double(bet.bet) ?? 0.0
                                                        let coefficient = Double(bet.coofiecient) ?? 0.0
                                                        let potentialWin = betAmount * coefficient - betAmount

                                                        
                                                        Text(
                                                            bet.isWon == nil
                                                                ? String(format: "Potential: +$%.2f", potentialWin)
                                                                : (bet.isWon!
                                                                    ? String(format: "+$%.2f", potentialWin)
                                                                    : String(format: "-$%.2f", betAmount))
                                                        )
                                                            .FontRegular(size: 16, color:  bet.isWon == nil
                                                                         ? Color(red: 148/255, green: 163/255, blue: 183/255)
                                                                         : (bet.isWon!
                                                                             ? Color(red: 33/255, green: 197/255, blue: 95/255)
                                                                             : Color(red: 239/255, green: 68/255, blue: 68/255)))
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .frame(height: 234)
                                    .cornerRadius(14)
                                    .padding(.horizontal)
                            }
                        }
                        
                        Color.clear.frame(height: 60)
                    }
                    .padding(.top, 10)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    HistoryView()
}


