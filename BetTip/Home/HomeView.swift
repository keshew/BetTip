import SwiftUI

struct HomePredictionModel: Identifiable, Codable {
    var id = UUID().uuidString
    var nameLeague: String
    var imageLeague: String
    var dateTime: String
    var firstTeamName: String
    var firstTeamImage: String
    var secondTeamName: String
    var secondTeamImage: String
    var aiPrediction: String
    var betText: String
    var coofiecient: String
    var confidence: String
}

struct HomeView: View {
    @StateObject var homeModel =  HomeViewModel()
    @State var isDetail = false
    let modelPrediction = [HomePredictionModel(nameLeague: "Premier League",
                                               imageLeague: "premierLeague",
                                               dateTime: "Today, 15:30",
                                               firstTeamName: "Man United",
                                               firstTeamImage: "manUn",
                                               secondTeamName: "Liverpool",
                                               secondTeamImage: "liverpool",
                                               aiPrediction: "67%",
                                               betText: "Liverpool Win",
                                               coofiecient: "2.45",
                                               confidence: "High confidence"),
                           
                           HomePredictionModel(nameLeague: "La Liga",
                                               imageLeague: "laliga",
                                               dateTime: "Today, 18:00",
                                               firstTeamName: "Real Madrid",
                                               firstTeamImage: "real",
                                               secondTeamName: "Barcelona",
                                               secondTeamImage: "barc",
                                               aiPrediction: "83%",
                                               betText: "Over 2.5 Goals",
                                               coofiecient: "1.85",
                                               confidence: "Very high confidence"),
                           
                           HomePredictionModel(nameLeague: "NBA",
                                               imageLeague: "nba",
                                               dateTime: "Tomorrow, 02:30",
                                               firstTeamName: "Lakers",
                                               firstTeamImage: "lakers",
                                               secondTeamName: "Warriors",
                                               secondTeamImage: "warriors",
                                               aiPrediction: "50%",
                                               betText: "Warriors Win",
                                               coofiecient: "1.95",
                                               confidence: "Medium confidence")]
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Image(.onbImg)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("BetForecast")
                            .FontRegular(size: 18)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                        .frame(height: 1)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(modelPrediction, id: \.id) { item in
                            Rectangle()
                                .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 51/255, green: 65/255, blue: 84/255), lineWidth: 3)
                                        .overlay {
                                            VStack(spacing: 15) {
                                                HStack {
                                                    Image(item.imageLeague)
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                    
                                                    Text(item.nameLeague)
                                                        .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Spacer()
                                                    
                                                    Text(item.dateTime)
                                                        .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                }
                                                
                                                HStack {
                                                    Image(item.firstTeamImage)
                                                        .resizable()
                                                        .frame(width: 32, height: 32)
                                                    
                                                    Text(item.firstTeamName)
                                                        .FontRegular(size: 14)
                                                    
                                                    Spacer()
                                                    
                                                    Text("VS")
                                                        .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                    
                                                    Spacer()
                                                    
                                                    Text(item.secondTeamName)
                                                        .FontRegular(size: 14)
                                                    
                                                    Image(item.secondTeamImage)
                                                        .resizable()
                                                        .frame(width: 32, height: 32)
                                                }
                                                
                                                Rectangle()
                                                    .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                                                    .overlay {
                                                        VStack {
                                                            HStack {
                                                                Text("AI Prediction")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Spacer()
                                                                
                                                                Circle()
                                                                    .stroke(.white, lineWidth: 3)
                                                                    .overlay {
                                                                        Text(item.aiPrediction)
                                                                            .FontRegular(size: 12, color: Color(red: 33/255, green: 197/255, blue: 93/255))
                                                                    }
                                                                    .frame(width: 32, height: 32)
                                                            }
                                                            
                                                            VStack {
                                                                HStack {
                                                                    Text(item.betText)
                                                                        .FontRegular(size: 14, color: Color(red: 33/255, green: 197/255, blue: 93/255))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text(item.coofiecient)
                                                                        .FontRegular(size: 18, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                                                                }
                                                                
                                                                HStack {
                                                                    Text(item.confidence)
                                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text("Odds")
                                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(height: 108)
                                                    .cornerRadius(12)
                                                
                                                Button(action: {
                                                    isDetail = true
                                                }) {
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 59/255, green: 130/255, blue: 246/255),
                                                                                      Color(red: 38/255, green: 99/255, blue: 235/255)], startPoint: .leading, endPoint: .trailing))
                                                        .overlay {
                                                            HStack {
                                                                Text("View Details")
                                                                    .FontRegular(size: 16)
                                                                
                                                                Image(systemName: "arrow.right")
                                                                    .foregroundStyle(.white)
                                                            }
                                                        }
                                                        .frame(height: 44)
                                                        .cornerRadius(12)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 282)
                                .cornerRadius(16)
                                .padding(.horizontal)
                        }
                        
                        Color.clear.frame(height: 60)
                    }
                }
                .padding(.top)
            }
            .padding(.top)
        }
        .fullScreenCover(isPresented: $isDetail) {
            DetailsView()
        }
    }
}

#Preview {
    HomeView()
}

