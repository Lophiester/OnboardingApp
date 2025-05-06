//
//  MultiStepOnboardingFlow.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/05.
//

import SwiftUI



struct OnBoardingPage: Identifiable{
    let id = UUID()
    let index: Int
    let title: String
    let description: String
    let image: String
}


struct MultiStepOnboardingFlowView: View {
    
    @Binding var onboarded: Bool
    @State private var selectedIndex = 0

    let onBoardingPages: [OnBoardingPage] = [
        ("Recharge Your Mind", "A short nap can boost your memory, creativity, and focus.", "onboardingart1"),
        ("Sleep is Your Superpower", "Getting a full night’s sleep can increase your learning ability by up to 300%.", "onboardingart2"),
        ("Ready to Begin?", "Let’s start your journey to a more rested and productive life.", "onboardingart3")
    ]
    .enumerated()
    .map { index, item in
        OnBoardingPage(index: index, title: item.0, description: item.1, image: item.2)
    }

    var body: some View {
        ZStack{
            Color.beige
                .ignoresSafeArea()
            TabView(selection: $selectedIndex) {
                ForEach(onBoardingPages) { page in
                    OnboardingView(
                        title: page.title,
                        description: page.description,
                        image: page.image
                    )
                    .tag(page.index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            
            // Indicadores personalizados
            VStack {
                Spacer()
                HStack(spacing: 8) {
                    ForEach(onBoardingPages) { page in
                        Circle()
                            .fill(page.index == selectedIndex ? Color.indigo : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                            .animation(.easeInOut, value: selectedIndex)
                    }
                }
                .padding(.bottom, 16)
                
                OnboardingButton(action: {
                    if selectedIndex < onBoardingPages.count - 1 {
                        selectedIndex += 1
                    } else {
                        onboarded = true
                    }
                }, buttonDescription: selectedIndex == onBoardingPages.count - 1 ? "Get Started" : "Next")
                .padding(.bottom, 40)
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    MultiStepOnboardingFlowView(onboarded: Binding.constant(false))
}
