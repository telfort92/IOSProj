//
//  ContentView.swift
//  Code History
//
//  Created by pitel on 6/21/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel() // Updated
    
    var body: some View {
        ZStack{
            GameColor.main.ignoresSafeArea() // Updated
            VStack{
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                QuestionView(question: viewModel.currentQuestion)
            }
        }
        .foregroundColor(.white)
        .navigationBarHidden(true) // New line
        .environmentObject(viewModel) // new line
        .background(NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)), isActive: .constant(viewModel.gameIsOver), label: {EmptyView() }))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
