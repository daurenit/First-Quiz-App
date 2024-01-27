//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
//    var timer: Timer? = Timer()
    
    var quizBrain = QuizBrain()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        questionLabel.text = quiz[0]
        updateUI()
//        progressBar.progress = Float(questionNumber / 12)
    }
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
//        let userAnswer = sender.currentTitle!
        let userAnswer = sender.currentTitle!
//        let actualAnswer = quiz[questionNumber].answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    
    @objc func updateUI() {
//        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        progressBar.progress = quizBrain.getProgress()
        
//        questionLabel.text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstButton.setTitle(quizBrain.getQuestionOption1(), for: .normal)
        secondButton.setTitle(quizBrain.getQuestionOption2(), for: .normal)
        thirdButton.setTitle(quizBrain.getQuestionOption3(), for: .normal)
        
//        trueButton.backgroundColor = UIColor.clear
//        falseButton.backgroundColor = UIColor.clear
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
    
}

