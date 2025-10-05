import SwiftUI

struct TabBarView: View {
    @StateObject var tabBarModel =  TabBarViewModel()
    @State private var selectedTab: CustomTabBar.TabType = .Home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if selectedTab == .Home {
                    HomeView()
                } else if selectedTab == .Predictions {
                    PredictionView()
                } else if selectedTab == .History {
                    HistoryView()
                } else if selectedTab == .Bankroll {
                    BankRollManagerView()
                } else if selectedTab == .Profile {
                    ProfileView()
                }
            }
            .frame(maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 0)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}


struct CustomTabBar: View {
    @Binding var selectedTab: TabType
    
    enum TabType: Int {
        case Home
        case Predictions
        case History
        case Bankroll
        case Profile
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                    .frame(height: 120)
                    .edgesIgnoringSafeArea(.bottom)
                
                Rectangle()
                    .fill(Color(red: 51/255, green: 65/255, blue: 85/255))
                    .frame(height: 1)
            }
            .offset(y: 55)
            
            HStack(spacing: 10) {
                TabBarItem(imageName: "tab1", tab: .Home, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab2", tab: .Predictions, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab3", tab: .History, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab4", tab: .Bankroll, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab5", tab: .Profile, selectedTab: $selectedTab)
            }
            .padding(.top, 15)
            .padding(.horizontal)
            .frame(height: 60)
        }
    }
}

struct TabBarItem: View {
    let imageName: String
    let tab: CustomTabBar.TabType
    @Binding var selectedTab: CustomTabBar.TabType
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            ZStack {
                if selectedTab == tab {
                    Rectangle()
                        .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                        .frame(width: tab == .Predictions ? 64 : 54, height: 64)
                        .cornerRadius(12)
                }
                VStack(spacing: 8) {
                    Image(selectedTab == tab ? imageName + "Picked" : imageName)
                        .resizable()
                        .frame(width: tab == .Profile ? 17 : 20, height: 20)
                    
                    Text("\(tab)")
                        .FontRegular(size: 12, color: selectedTab == tab ? .white : Color(red: 148/255, green: 163/255, blue: 185/255))
                    
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 64)
        }
    }
}
