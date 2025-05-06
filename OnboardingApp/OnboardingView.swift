//
//  OnboardingView.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/05.
//

import SwiftUI

struct OnboardingView: View {
    

    
    var title: String
    var description: String
    var image: String
    
    var body: some View {
        ZStack{
            VStack {
                Image(image)
                    .padding(.top,100)
                Spacer()
            }
            // Gradient
            LinearGradient(colors: [.clear, .beige], startPoint: UnitPoint(x: 0.5, y: 0.4), endPoint: UnitPoint(x: 0.5, y: 0.5))
                .ignoresSafeArea()
         
            //Text
            VStack{
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 100)
                    .padding(.bottom)
                    .foregroundStyle(.indigo)
                Text(description)
                    .foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal,30)
            .multilineTextAlignment(.center)
        }
        
     
    }
}

#Preview {
    OnboardingView(title: "Restul sleep will help you succeed", description: "Take a nap and wake up feeling refreshed", image: "onboardingart1")
}
