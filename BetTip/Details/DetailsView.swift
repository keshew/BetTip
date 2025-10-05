import SwiftUI

struct DetailsView: View {
    @StateObject var detailsModel =  DetailsViewModel()
    @Environment(\.presentationMode) var presentationMode
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
                        Text("Premier League")
                            .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        Text("Today, 15:00 GMT")
                            .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                                Image(.manUn)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                
                                Text("Man United")
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
                                Image(.liverpool)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                
                                Text("Liverpool")
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
                                                    Text("Man United Win")
                                                        .FontRegular(size: 18)
                                                    
                                                    Text("Confidence Score")
                                                        .FontRegular(size: 12, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                                }
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 98)
                                            .cornerRadius(14)
                                        
                                        Text("Based on recent form, head-to-head records, and player availability. Home advantage and current league position favor United.")
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
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
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("Man United 0.0")
                                                                    .FontRegular(size: 14)
                                                                
                                                                Text("1.92")
                                                                    .FontRegular(size: 12, color: Color(red: 215/255, green: 218/255, blue: 220/255))
                                                            }
                                                        }
                                                        .frame(height: 60)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                                                        .overlay {
                                                            VStack {
                                                                Text("Liverpool 0.0")
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
                    
                    VStack {
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
                                Text("Based on your Balanced strategy")
                                    .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                
                                Text("5% of Bankroll")
                                    .FontRegular(size: 24)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 5) {
                                Text("Suggested Amount")
                                    .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                
                                Text("$50")
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
                                
                                Text("Medium")
                                    .FontRegular(size: 14, color: Color(red: 250/255, green: 204/255, blue: 23/255))
                            }
                            
                            HStack {
                                Text("Expected Return:")
                                    .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                
                                Spacer()
                                
                                Text("$32.50")
                                    .FontRegular(size: 14, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                            }
                            
                            HStack {
                                Text("Kelly Criterion:")
                                    .FontRegular(size: 14, color: Color(red: 148/255, green: 163/255, blue: 185/255))
                                
                                Spacer()
                                
                                Text("4.2%")
                                    .FontRegular(size: 14, color: Color(red: 96/255, green: 165/255, blue: 250/255))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                .padding(.top, 5)
            }
            .padding(.top)
        }
    }
}

#Preview {
    DetailsView()
}

