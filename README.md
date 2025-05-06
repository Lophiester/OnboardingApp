# 📘 Onboarding Glossary - Onboarding App

This document describes all the components and concepts involved in building the app's onboarding flow. It serves as a reference for future reviews and reuse in other projects.

---

## 📑 Table of Contents

- [🔹 Summary](#-summary)
- [1. Onboarding](#1-onboarding)
- [2. MultiStepOnboardingFlowView](#2-multisteponboardingflowview)
- [3. OnboardingView](#3-onboardingview)
- [4. OnboardingButton](#4-onboardingbutton)
- [5. TabView](#5-tabview)
- [6. @AppStorage](#6-appstorage)
- [7. @Binding](#7-binding)
- [8. Custom Indicators](#8-custom-indicators)
- [🔁 Reuse in Other Projects](#-reuse-in-other-projects)
- [🎨 Visual Inspiration](#-visual-inspiration)
- [✅ Conclusion](#-conclusion)

---


## 🔹 Summary

This onboarding flow consists of several introductory screens displayed sequentially, using `TabView`, `OnboardingView`, `OnboardingButton`, and state management with `@AppStorage` and `@Binding`. At the end of the flow, a button allows the user to finish the onboarding, marking it as completed. The onboarding has a clean layout with images, text, and visual indicators that enhance the user experience.

---

## 1. **Onboarding**
An explanation of the onboarding concept and its application to introduce the app to the user.

### Example:
A sequence of screens with information about sleep to educate and engage the user.

---

## 2. **MultiStepOnboardingFlowView**
Manages the display of onboarding pages with navigation via `TabView`.

### Example:
```swift
TabView(selection: $selectedIndex) {
    ForEach(onBoardingPages2) { page in
        OnboardingView(...)
            .tag(page.index)
    }
}
```

---

## 3. **OnboardingView**
Responsible for each individual screen with a title, description, and image.

### Example:
```swift
OnboardingView(
    title: "Recharge Your Mind",
    description: "A short nap can boost your memory...",
    image: "onboardingart1"
)
```

---

## 4. **OnboardingButton**
A custom button that allows advancing or finishing the onboarding.

### Example:
```swift
OnboardingButton(action: {
    if selectedIndex < total {
        selectedIndex += 1
    } else {
        onboarded = true
    }
}, buttonDescription: ...)
```

---

## 5. **TabView**
Used to create the paginated experience.

---

## 6. **@AppStorage**
Stores whether the user has already gone through onboarding.

### Example:
```swift
@AppStorage("onboarded") private var onboarded = false
```

---

## 7. **@Binding**
Connects the `onboarded` state between views.

---

## 8. **Custom Indicators**
Visual circles indicating progress in the onboarding.

---

## 🔁 Reuse in Other Projects

This onboarding model is highly reusable. Simply:

- Change the texts and images in the `onBoardingPages2` array.
- Replace `OnboardingView` with a version with a new layout, if necessary.
- Reuse the custom button (`OnboardingButton`).

Ideal for any app with an introductory flow.

---

## 🎨 Visual Inspiration

For design creation:

- **[Icons8](https://icons8.com/)** – Source of high-quality free icons and illustrations.
- **[Mobbin](https://mobbin.com/)** – Repository of UIs from real apps, used for reference of layouts and visual patterns.

---


---

## 🧠 Using `.enumerated()` and `.map`

In onboarding, we use a combination of `.enumerated()` with `.map` to dynamically generate an array of pages (`OnBoardingPage`) containing the index of each one. This approach allows us to:

- Track the position of each page in the flow (`index`)
- Use the index for navigation control and visual identification (like the circular indicators)

### Example:
```swift
let onBoardingPages: [OnBoardingPage] = [
    ("Recharge Your Mind", "A short nap can boost your memory...", "onboardingart1"),
    ("Sleep is Your Superpower", "Getting a full night’s sleep...", "onboardingart2"),
    ("Ready to Begin?", "Let’s start your journey...", "onboardingart3")
]
.enumerated()
.map { index, item in
    OnBoardingPage(index: index, title: item.0, description: item.1, image: item.2)
}
```

### Benefits:
- `.enumerated()` transforms the array to include the index (position) of each item.
- `.map` allows transforming this array into instances of the `OnBoardingPage` type.

This keeps the code cleaner, safer, and more scalable.


## ✅ Conclusion

This glossary serves as technical documentation and a practical guide for building or replicating onboarding flows in SwiftUI, with a focus on clarity, visual simplicity, and component reuse.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

