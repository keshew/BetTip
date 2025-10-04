import SwiftUI

extension Text {
    func FontRegular(size: CGFloat,
                     color: Color = .white)  -> some View {
        self.font(.custom("Akshar-Regular", size: size))
            .foregroundColor(color)
    }
    
    func FontMedium(size: CGFloat,
                    color: Color = .white)  -> some View {
        self.font(.custom("Akshar-Medium", size: size))
            .foregroundColor(color)
    }
    
    func FontSemiBold(size: CGFloat,
                   color: Color = .white)  -> some View {
        self.font(.custom("Akshar-SemiBold", size: size))
            .foregroundColor(color)
    }
    
    func FontBold(size: CGFloat,
                   color: Color = .white)  -> some View {
        self.font(.custom("Akshar-Bold", size: size))
            .foregroundColor(color)
    }
}
