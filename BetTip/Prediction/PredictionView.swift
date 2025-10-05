import SwiftUI

enum SelectedLiga {
    case premier
    case laliga
    case nba
}

enum BetCategory {
    case outcome
    case total
    case bothTeam
    case handicaps
}

struct PredictionModelMatch: Identifiable {
    var id = UUID().uuidString
    var league: String
    var teamAName: String
    var teamBName: String
    var time: String
    var confidence: Int
    var prediction: String
    var coeficente: String
    var category: BetCategory
}


struct PredictionView: View {
    @StateObject var predictionModel =  PredictionViewModel()
    @State var selectedLiga: SelectedLiga? = .premier
    @State var betCategory = BetCategory.outcome
    let modelMatch = [PredictionModelMatch(league: "Premier League",
                                           teamAName: "Arsenal",
                                           teamBName: "Chelsea",
                                           time: "15:30",
                                           confidence: 4,
                                           prediction: "Arsenal Win",
                                           coeficente: "2.10",
                                           category: .outcome),
                      PredictionModelMatch(league: "La Liga",
                                           teamAName: "Real Madrid",
                                           teamBName: "Barcelona",
                                           time: "18:00",
                                           confidence: 5,
                                           prediction: "Over 2.5 Goals",
                                           coeficente: "2.10",
                                           category: .total),
                      PredictionModelMatch(league: "NBA",
                                           teamAName: "Lakers",
                                           teamBName: "Warriors",
                                           time: "21:30",
                                           confidence: 3,
                                           prediction: "Warriors +5.5",
                                           coeficente: "1.95",
                                           category: .handicaps),
                      PredictionModelMatch(league: "Premier League",
                                           teamAName: "Liverpool",
                                           teamBName: "Man City",
                                           time: "17:30",
                                           confidence: 5,
                                           prediction: "Both Teams Score",
                                           coeficente: "1.65",
                                           category: .bothTeam)]
    
    func gradient(item: PredictionModelMatch) -> LinearGradient {
        if item.league == "Premier League" {
            return LinearGradient(colors: [Color(red: 239/255, green: 68/255, blue: 68/255),
                                           Color(red: 220/255, green: 37/255, blue: 38/255)], startPoint: .leading, endPoint: .trailing)
        } else if item.league == "La Liga" {
            return LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                           Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing)
        } else {
            return LinearGradient(colors: [Color(red: 234/255, green: 180/255, blue: 5/255),
                                           Color(red: 234/255, green: 88/255, blue: 12/255)], startPoint: .leading, endPoint: .trailing)
        }
    }
    
    func colorBet(item: PredictionModelMatch) -> Color {
        if item.category == .bothTeam {
            return Color(red: 9/255, green: 145/255, blue: 178/255)
        } else if item.category == .handicaps {
            return Color(red: 147/255, green: 51/255, blue: 234/255)
        } else if item.category == .total {
            return Color(red: 38/255, green: 99/255, blue: 235/255)
        } else if item.category == .outcome {
            return Color(red: 21/255, green: 163/255, blue: 73/255)
        } else {
            return Color(red: 21/255, green: 163/255, blue: 73/255)
        }
    }
    
    var filteredMatches: [PredictionModelMatch] {
        return modelMatch.filter { match in
            (selectedLiga == nil || match.league == leagueString(for: selectedLiga)) &&
            match.category == betCategory
        }
    }

    func leagueString(for liga: SelectedLiga?) -> String {
        switch liga {
        case .premier: return "Premier League"
        case .laliga: return "La Liga"
        case .nba: return "NBA"
        default: return ""
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Image(.onbImg)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("AI Predictions")
                            .FontRegular(size: 18)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                        .frame(height: 1)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        HStack {
                            Text("Active Leagues")
                                .FontRegular(size: 20)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button(action: {
                                    selectedLiga = nil
                                }) {
                                    Rectangle()
                                        .fill(selectedLiga == nil ? LinearGradient(colors: [Color(red: 30/255, green: 41/255, blue: 59/255),
                                                                                            Color(red: 22/255, green: 26/255, blue: 42/255)], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            Text("All")
                                                .FontRegular(size: 14)
                                        }
                                        .frame(width: 56, height: 36)
                                        .cornerRadius(16)
                                }
                                
                                Button(action: {
                                    selectedLiga = .premier
                                }) {
                                    Rectangle()
                                        .fill(selectedLiga == SelectedLiga.premier ? LinearGradient(colors: [Color(red: 239/255, green: 68/255, blue: 68/255),
                                                                                                             Color(red: 220/255, green: 37/255, blue: 38/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            HStack {
                                                Image(systemName: "soccerball")
                                                    .foregroundStyle(.white)
                                                
                                                Text("Premier League")
                                                    .FontRegular(size: 14)
                                            }
                                        }
                                        .frame(width: 139, height: 36)
                                        .cornerRadius(16)
                                }
                                
                                Button(action: {
                                    selectedLiga = .laliga
                                }) {
                                    Rectangle()
                                        .fill(selectedLiga == SelectedLiga.laliga ? LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                                                                                            Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            HStack {
                                                Image(systemName: "soccerball")
                                                    .foregroundStyle(.white)
                                                
                                                Text("La Liga")
                                                    .FontRegular(size: 14)
                                            }
                                        }
                                        .frame(width: 92, height: 36)
                                        .cornerRadius(16)
                                }
                                
                                Button(action: {
                                    selectedLiga = .nba
                                }) {
                                    Rectangle()
                                        .fill(selectedLiga == SelectedLiga.nba ? LinearGradient(colors: [Color(red: 234/255, green: 180/255, blue: 5/255),
                                                                                                         Color(red: 234/255, green: 88/255, blue: 12/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            HStack {
                                                Image(systemName: "basketball")
                                                    .foregroundStyle(.white)
                                                
                                                Text("NBA")
                                                    .FontRegular(size: 14)
                                            }
                                        }
                                        .frame(width: 76, height: 36)
                                        .cornerRadius(16)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Bet Categories")
                                .FontRegular(size: 20)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        VStack(spacing: 20) {
                            HStack(spacing: 20) {
                                Button(action: {
                                    betCategory = .outcome
                                }) {
                                    Rectangle()
                                        .fill(betCategory == .outcome ? LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                                                                                Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Image(.outcomes)
                                                        .resizable()
                                                        .frame(width: 20, height: 28)
                                                    
                                                    Spacer()
                                                    
                                                    Image(betCategory == .outcome ? .selected : .unselected)
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text("Outcomes")
                                                        .FontRegular(size: 16)
                                                    
                                                    Text("Win/Draw/Loss")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 116)
                                        .cornerRadius(16)
                                }
                                
                                Button(action: {
                                    betCategory = .total
                                }) {
                                    Rectangle()
                                        .fill(betCategory == .total ? LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                                                                              Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Image(.totals)
                                                        .resizable()
                                                        .frame(width: 14, height: 28)
                                                    
                                                    Spacer()
                                                    
                                                    Image(betCategory == .total ? .selected : .unselected)
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text("Totals")
                                                        .FontRegular(size: 16)
                                                    
                                                    Text("Over/Under")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 116)
                                        .cornerRadius(16)
                                }
                            }
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    betCategory = .bothTeam
                                }) {
                                    Rectangle()
                                        .fill(betCategory == .bothTeam ? LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                                                                                 Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Image(.bothTeams)
                                                        .resizable()
                                                        .frame(width: 20, height: 28)
                                                    
                                                    Spacer()
                                                    
                                                    Image(betCategory == .bothTeam ? .selected : .unselected)
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text("Both Teams")
                                                        .FontRegular(size: 16)
                                                    
                                                    Text("To Score")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 116)
                                        .cornerRadius(16)
                                }
                                
                                Button(action: {
                                    betCategory = .handicaps
                                }) {
                                    Rectangle()
                                        .fill(betCategory == .handicaps ? LinearGradient(colors: [Color(red: 38/255, green: 99/255, blue: 235/255),
                                                                                                  Color(red: 29/255, green: 78/255, blue: 216/255)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color(red: 51/255, green: 65/255, blue: 85/255)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Image(.handicaps)
                                                        .resizable()
                                                        .frame(width: 20, height: 28)
                                                    
                                                    Spacer()
                                                    
                                                    Image(betCategory == .handicaps ? .selected : .unselected)
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text("Handicaps")
                                                        .FontRegular(size: 16)
                                                    
                                                    Text("Asian/Euro")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 116)
                                        .cornerRadius(16)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Top 5 Predictions Today")
                                .FontRegular(size: 20)
                            
                            Spacer()
                            
                            HStack {
                                Circle()
                                    .fill(Color(red: 31/255, green: 125/255, blue: 77/255))
                                    .frame(width: 8, height: 8)
                                
                                Text("Live")
                                    .FontRegular(size: 14, color: Color(red: 76/255, green: 222/255, blue: 129/255))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        VStack(spacing: 20) {
                            ForEach(filteredMatches, id: \.id) { item in
                                Rectangle()
                                    .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(red: 51/255, green: 65/255, blue: 85/255), lineWidth: 2)
                                            .overlay {
                                                VStack {
                                                    HStack {
                                                        Rectangle()
                                                            .fill(gradient(item: item))
                                                            .frame(width: 40, height: 40)
                                                            .overlay {
                                                                Image(systemName: item.league == "NBA" ? "basketball" : "soccerball")
                                                                    .foregroundStyle(.white)
                                                            }
                                                            .cornerRadius(8)
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("\(item.teamAName) vs \(item.teamBName)")
                                                                .FontRegular(size: 16)
                                                            
                                                            Text("\(item.league) • \(item.time)")
                                                                .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        VStack(alignment: .trailing) {
                                                            HStack {
                                                                ForEach(0..<5, id: \.self) { index in
                                                                    if index + 1 <= item.confidence  {
                                                                        Image(.fillStar)
                                                                            .resizable()
                                                                            .frame(width: 13, height: 12)
                                                                    } else {
                                                                        Image(.emptyStar)
                                                                            .resizable()
                                                                            .frame(width: 13, height: 12)
                                                                    }
                                                                }
                                                            }
                                                            
                                                            Text("\(item.confidence)/5 Confidence")
                                                                .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                        }
                                                    }
                                                    
                                                    HStack {
                                                        Rectangle()
                                                            .fill(colorBet(item: item))
                                                            .overlay {
                                                                Text("\(item.prediction)")
                                                                    .FontRegular(size: 13)
                                                            }
                                                            .frame(width: 100, height: 28)
                                                            .cornerRadius(12)
                                                        
                                                        Spacer()
                                                        
                                                        VStack {
                                                            Text(item.coeficente)
                                                                .FontRegular(size: 16, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                            
                                                            Text("Odds")
                                                                .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                        }
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .frame(height: 130)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    PredictionView()
}

