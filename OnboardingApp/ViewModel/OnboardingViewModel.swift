//
//  OnboardingViewModel.swift
//  OnboardingApp
//
//  Created by Charles Yamamoto on 2025/05/14.
//

import Foundation

@Observable
class OnboardingViewModel {
    
    var selectedIndex = 0
    
    var onboardingPages:[OnBoardingPage] = [
        OnBoardingPage(index: 0, title: "Recharge Your Mind", description: "A short nap can boost your memory, creativity, and focus.", image: "onboardingart1"),
        OnBoardingPage(index: 1, title: "Sleep is Your Superpower", description: "Getting a full night’s sleep can increase your learning ability by up to 300%.", image: "onboardingart2"),
        OnBoardingPage(index: 2, title: "Ready to Begin?", description: "Let’s start your journey to a more rested and productive life", image: "onboardingart3")
    ]
    
    func nextPageButton( lastPage: () -> Void  ){
        
        if selectedIndex < onboardingPages.count - 1 {
            selectedIndex += 1
        } else {
         lastPage()
        }
    }
    
    func changeDescriptionButton() -> String {
        if selectedIndex == onboardingPages.count - 1{
            "Get Started"
        }else {
            "Next"
        }
    }
    
}
