//
//  ContentView.swift
//  TriviaGame
//
//  Created by Jack Hyde on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    
    // STATE VARIBLES
    @State var message = "Click the START GAME button to begin"
    
    // State variables used to display options/answers for user to select
    @State var Q1 = ""
    @State var Q2 = ""
    @State var Q3 = ""
    @State var Q4 = ""
    
    @State var buttonText = "START GAME"
    
    // State value used to determine which question to display
    @State var qIndex = -1
    
    // State value used to keep track of user's score
    @State var score = 0
    
    let questions = [
        "What group sang the song 'Stairway to Heaven'?",
        "What group sang the song 'Bohemian Rhapsody'?",
        "What group sang the song 'Dream On'?"
    ]
    
//    let answers = [
//        "Led Zepplin",
//        "Pink Floyd",
//        "Van Halen",
//        "Queen"
//    ]
   
    let answers = [
        [
            ["Led Zepplin", "Correct"],
            ["Pink Floyd", "Wrong"],
            ["Van Halen", "Wrong"],
            ["Queen", "Wrong"]
        ],
        [
            ["Led Zepplin", "Wrong"],
            ["Pink Floyd", "Wrong"],
            ["Van Halen", "Wrong"],
            ["Queen", "Correct"]
        ],
        [
            ["The Rolling Stones", "Wrong"],
            ["Aerosmith", "Correct"],
            ["Guns N' Roses", "Wrong"],
            ["Eagles", "Wrong"]
        ]
    ]
    
    func hideOptions(){
        Q1 = ""
        Q2 = ""
        Q3 = ""
        Q4 = ""
    }

    func nextQuestion(){
        if (qIndex < questions.count - 1){
            qIndex += 1
            message = questions[qIndex]
            Q1 = answers[qIndex][0][0]
            Q2 = answers[qIndex][1][0]
            Q3 = answers[qIndex][2][0]
            Q4 = answers[qIndex][3][0]
            buttonText = "NEXT QUESTION"
        } else {
            // Displays final score to user
            message = "Game Over. You got " + String(score) + " correct."
            buttonText = "GAME OVER"
            hideOptions()
        }
        
    }
    
    // Function used to check if user's guess is correct or not. The "a" parameter is used to determine which option was selected.
    // Also, the function adds a point to the user's score for each correct answer
    func checkAnswer(a: Int){
        if (answers[qIndex][a][1] == "correct"){
            message = "CORRECT!!!"
            score += 1
        } else {
            message = "Sorry wrong answer"
        }
        
        hideOptions()
    }
    
    var body: some View {
        ZStack{

            Color.red.ignoresSafeArea()

            VStack {
                Spacer()
                
                Text("THE CLASSIC ROCK TRIVIA GAME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Using the "message" state variable to update the message displayed to the user
                Text(message)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 0)
                    } label: {
                        // Using the "optionOne" state variable to update the option displayed to the user
                        Text(Q1)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 1)
                    } label: {
                        // Using the "optionTwo" state variable to update the option displayed to the user
                        Text(Q2)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()

                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 2)
                    } label: {
                        // Using the "optionThree" state variable to update the option displayed to the user
                        Text(Q3)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()
                    
                    Button {
                        checkAnswer(a: 3)
                    } label: {
                        // Using the "optionFour" state variable to update the option displayed to the user
                        Text(Q4)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()

                }

                
                Spacer()
                
                Button {
                    nextQuestion()
                } label: {
                    // Using the "buttonText" state variable to update the text in the button displayed to the user
                    Text(buttonText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
