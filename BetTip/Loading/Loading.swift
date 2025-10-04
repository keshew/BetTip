import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack(spacing: 120) {
                Image(.onbImg)
                    .resizable()
                    .frame(width: 96, height: 96)
                
                VStack(spacing: 50) {
                    VStack(spacing: 20) {
                        Text("Welcome to Smart Betting")
                            .FontRegular(size: 24)
                        
                        Text("Make informed decisions with AI-powered\npredictions and professional bet\nmanagement")
                            .FontRegular(size: 18)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(.getStartedImg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 166, height: 56)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
