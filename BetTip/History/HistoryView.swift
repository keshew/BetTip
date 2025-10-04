import SwiftUI

struct HistoryView: View {
    @StateObject var historyModel =  HistoryViewModel()
    
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
                                    Text("68.5%")
                                        .FontRegular(size: 24, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                    
                                    Text("Win Rate")
                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("147")
                                        .FontRegular(size: 24, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                    
                                    Text("Total Bets")
                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("+$2,340")
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
                        ForEach(0..<3, id: \.self) { index in
                            Rectangle()
                                .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 2)
                                        .overlay {
                                            VStack(spacing: 15) {
                                                HStack {
                                                    Image(.premier2)
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("Arsenal vs Chelsea")
                                                            .FontRegular(size: 14)
                                                        
                                                        Text("Premier League • Dec 15, 2024")
                                                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Rectangle()
                                                        .fill(Color(red: 33/255, green: 197/255, blue: 93/255))
                                                        .overlay {
                                                            HStack(spacing: 4) {
                                                                Image("checkmarkImg")
                                                                    .resizable()
                                                                    .frame(width: 12, height: 15)
                                                                
                                                                Text("Won")
                                                                    .FontRegular(size: 12)
                                                            }
                                                        }
                                                        .frame(width: 51, height: 24)
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
                                                                
                                                                Text("Arsenal Win")
                                                                    .FontRegular(size: 16)
                                                            }
                                                            
                                                            HStack {
                                                                Text("Odds")
                                                                    .FontRegular(size: 14, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                                
                                                                Spacer()
                                                                
                                                                Text("2.15")
                                                                    .FontRegular(size: 16, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                                            }
                                                            
                                                            HStack {
                                                                Text("Bet Amount")
                                                                    .FontRegular(size: 14, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                                
                                                                Spacer()
                                                                
                                                                Text("$50.00")
                                                                    .FontRegular(size: 16)
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(height: 112)
                                                    .cornerRadius(14)
                                                
                                                HStack {
                                                    Text("+$57.50")
                                                        .FontRegular(size: 16, color: Color(red: 33/255, green: 197/255, blue: 95/255))
                                                    
                                                    Spacer()
                                                    
                                                    Text("Over/Under")
                                                        .FontRegular(size: 12, color: Color(red: 202/255, green: 213/255, blue: 225/255))
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 234)
                                .cornerRadius(14)
                                .padding(.horizontal)
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

