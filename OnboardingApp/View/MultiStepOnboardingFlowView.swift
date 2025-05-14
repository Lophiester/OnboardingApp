//
//  MultiStepOnboardingFlow.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/05.
//

import SwiftUI


struct MultiStepOnboardingFlowView: View {
    
    @Binding var onboarded: Bool
    
    @State private var viewModel = OnboardingViewModel()


    var body: some View {
        ZStack{
            Color.beige
                .ignoresSafeArea()
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(viewModel.onboardingPages) { page in
                    OnboardingView(
                        title: page.title,
                        description: page.description,
                        image: page.image
                    )
                    .tag(page.index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Indicadores personalizados
            VStack {
                Spacer()
                HStack(spacing: 8) {
                    ForEach(viewModel.onboardingPages) { page in
                        Circle()
                            .fill(page.index == viewModel.selectedIndex ? Color.indigo : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.bottom, 16)
                
                OnboardingButton(action: {
                    withAnimation{
                    viewModel.nextPageButton {
                        onboarded = true
                    }}
                }, buttonDescription:
                                    viewModel.changeDescriptionButton()
                )
                .padding(.bottom, 40)
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    MultiStepOnboardingFlowView(onboarded: Binding.constant(false))
}
