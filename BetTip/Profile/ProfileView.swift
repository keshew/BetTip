import SwiftUI

struct ProfileView: View {
    @StateObject var profileModel =  ProfileViewModel()

    var body: some View {
        ZStack {
            Color(red: 30/255, green: 39/255, blue: 57/255).ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Image(.onbImg)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("Profile")
                            .FontRegular(size: 18)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 51/255, green: 65/255, blue: 84/255))
                        .frame(height: 1)
                }
                
                VStack(spacing: 15) {
                    Rectangle()
                        .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 51/255, green: 65/255, blue: 85/255))
                                .overlay {
                                    HStack {
                                        Image(.notif)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                        Text("Notifications")
                                            .FontRegular(size: 20)
                                            .padding(.leading, 10)
                                            
                                        Spacer()
                                        
                                        Toggle("", isOn: $profileModel.isOn)
                                            .toggleStyle(CustomToggleStyle())
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        .frame(height: 90)
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    Button(action: {
                        
                    }) {
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 85/255))
                                    .overlay {
                                        HStack {
                                            Image(.policy)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("Privacy Policy")
                                                .FontRegular(size: 20)
                                                .padding(.leading, 10)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(Color(red: 147/255, green: 164/255, blue: 185/255))
                                                    .font(.system(size: 20, weight: .semibold))
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 90)
                            .cornerRadius(14)
                            .padding(.horizontal)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Rectangle()
                            .fill(Color(red: 30/255, green: 41/255, blue: 59/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 51/255, green: 65/255, blue: 85/255))
                                    .overlay {
                                        HStack {
                                            Image(.termuse)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("Terms of Use")
                                                .FontRegular(size: 20)
                                                .padding(.leading, 10)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(Color(red: 147/255, green: 164/255, blue: 185/255))
                                                    .font(.system(size: 20, weight: .semibold))
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 90)
                            .cornerRadius(14)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color(red: 21/255, green: 163/255, blue: 73/255) : Color(red: 69/255, green: 90/255, blue: 109/255))
                .frame(width: 48, height: 24)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .offset(x: configuration.isOn ? 12 : -12)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
