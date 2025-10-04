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

struct PredictionView: View {
    @StateObject var predictionModel =  PredictionViewModel()
    @State var selectedLiga = SelectedLiga.premier
    @State var betCategory = BetCategory.outcome
    
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

