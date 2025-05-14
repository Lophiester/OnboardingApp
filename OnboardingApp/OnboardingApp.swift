//
//  OnboardingAppApp.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/05.
//

import SwiftUI

@main
struct OnboardingApp: App {
    
   @AppStorage("onboarded") private var onboarded = false
    
    var body: some Scene {
        WindowGroup {
            if onboarded{
                HomeView()
                
            } else {
                // show multi-step flow
                MultiStepOnboardingFlowView(onboarded: $onboarded)
                
            }
          
        }
    }
}
