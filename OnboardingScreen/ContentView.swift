//
//  ContentView.swift
//  OnboardingScreen
//
//  Created by dsm 5e on 30.05.2023.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "Onboarding1", title: "Начал изучать SWIFT?", description: "Забудь о курсах, все знания есть в нашем приложении."),
    OnBoardingStep(image: "Onboarding2", title: "Будь на связи", description: "Всегда контактируй со своими друзьями и ментором."),
    OnBoardingStep(image: "Onboarding3", title: "Закрепляй знания", description: "В любом месте, в любое время. Учеба единственное, что тебе нужно.")
]

struct ContentView: View {
    @State private var currentStep = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    self.currentStep = onBoardingSteps.count - 1
                } label: {
                    Text("Пропустить")
                        .padding(16)
                        .foregroundColor(.gray)
                }
                
            }
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count, id: \.self) { step in
                    VStack {
                        Image(onBoardingSteps[step].image)
                            .resizable()
                            .frame(width: 250, height: 250)
                        
                        Text(onBoardingSteps[step].title)
                            .font(.title.bold())
                        
                        Text(onBoardingSteps[step].description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.top, 16)
                    }
                    .tag(step)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HStack {
                ForEach(0..<onBoardingSteps.count, id: \.self) { step in
                    if step == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(Color("buttonColor"))
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
            }
            
            Button {
                if self.currentStep < onBoardingSteps.count - 1 {
                    self.currentStep += 1
                } else {
                    self.currentStep = 0
                }
            } label: {
                Text(currentStep < onBoardingSteps.count - 1 ? "Далее" : "Начинаем!")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color("buttonColor"))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
