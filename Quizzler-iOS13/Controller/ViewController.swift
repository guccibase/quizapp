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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    
  
    var quizBrain = Brain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        
        
        
        if quizBrain.checkAnswer(answer: sender.currentTitle!) {
            quizBrain.setScore(points:1)
            sender.backgroundColor = UIColor.green
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)

        }else{
            quizBrain.setScore(points:0)
            sender.backgroundColor = UIColor.red
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        }
        
       
    }

    @objc
    func updateUi() {
        scoreLabel.text = "Score : \(quizBrain.quizScore())" 
        questionLabel.text = quizBrain.quizQuestion()
        progressBar.progress = quizBrain.quizProgress()
        print(quizBrain.quizNumber())
        print(quizBrain.qAndA.count)
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

        
    }
}

