//
//  OnboardingButton.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/06.
//

import SwiftUI

struct OnboardingButton: View {
    
    var action: () -> Void
    var buttonDescription: String
    
    var body: some View {
        Button {
            // set onboarded flag to true
            withAnimation {
                action()
            }
          
        } label: {
            Text(buttonDescription)
                .frame(maxWidth: .infinity)
                .bold()
                .foregroundStyle(.white)
                .padding()
                .background(.indigo.gradient)
                .clipShape(.rect(cornerRadius: 30))
                .padding(.horizontal,30)
             
            
        }
        .padding(.bottom,40)
    }
}

#Preview {
    OnboardingButton(action: {}, buttonDescription: "Get Started")
}
