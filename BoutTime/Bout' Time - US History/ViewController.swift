//
//  ViewController.swift
//  Bout' Time - US History
//
//  Created by Francisco Luna on 3/10/19.
//  Copyright © 2019 Francisco Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Screens
    @IBOutlet weak var OpeningScreenButton: UIButton!
    @IBOutlet weak var GameScreen: UIStackView!
    @IBOutlet weak var GameOverScreen: UIView!
    
    // Game Screen
    // Event labels
    @IBOutlet weak var FirstChoiceLabel: UILabel!
    @IBOutlet weak var SecondChoiceLabel: UILabel!
    @IBOutlet weak var ThirdChoiceLabel: UILabel!
    @IBOutlet weak var FourthChoiceLabel: UILabel!
    // Buttons
    @IBOutlet weak var Down1: UIButton!
    @IBOutlet weak var Up2: UIButton!
    @IBOutlet weak var Down2: UIButton!
    @IBOutlet weak var Up3: UIButton!
    @IBOutlet weak var Down3: UIButton!
    @IBOutlet weak var Up4: UIButton!
    // Game Info labels
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var NextRoundButton: UIButton!
    @IBOutlet weak var InfoLabel: UILabel!
    
    // Round Screen
    @IBOutlet weak var ScoreLabel: UILabel!
    
    // Function to update labels
    func updateLabels() {
        FirstChoiceLabel.text = randomEvents[0].event
        SecondChoiceLabel.text = randomEvents[1].event
        ThirdChoiceLabel.text = randomEvents[2].event
        FourthChoiceLabel.text = randomEvents[3].event
    }
    
    // Function to disable or enable buttons
    func buttonsEnabeled(_ response: Bool) {
        Down1.isEnabled = response
        Up2.isEnabled = response
        Down2.isEnabled = response
        Up3.isEnabled = response
        Down3.isEnabled = response
        Up4.isEnabled = response
    }
    
    // Start new round
    func newRound() {
        NextRoundButton.isHidden = true
        TimerLabel.isHidden = false
        buttonsEnabeled(true)
        resetRound()
        updateLabels()
        startTimer()
    }
    
    // Start new game
    func newGame() {
        resetGame()
        newRound()
    }
    
    func updateNextroundButton() {
        testIfCorrect()
        if let gotCorrect = roundCorrect {
            if gotCorrect == true {
                NextRoundButton.setImage(UIImage(named: "next_round_success.png"), for: .normal)
                NextRoundButton.isHidden = false
            } else {
                NextRoundButton.setImage(UIImage(named: "next_round_fail.png"), for: .normal)
                NextRoundButton.isHidden = false
            }
        }
    }
    
    // Countdown timer
    var counter = 60 // Seconds to cound down
    var timer = Timer()

    // Function to update timer label
    func updateTimer() {
        if counter > 9 {
            TimerLabel.text = "00:\(counter)"
        } else {
            TimerLabel.text = "00:0\(counter)"
        }
    }
    
    func startTimer() {
        timer.invalidate() // Will make sure timer is stopped before starting again
        counter = 60
        TimerLabel.text = "00:\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    // Will be called to update the timer label whenever the timer is updated
    @objc func timerAction() {
        if counter > 0 { // Will continue to cycle until timer hits 0
            counter -= 1
            updateTimer()
        } else {
            timer.invalidate() // Once the timer hits 0, the timer will stop and the game will test to see if the  round is correct
            cellBeenShaken = true
            buttonsEnabeled(false)
            TimerLabel.isHidden = true
            updateNextroundButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GameScreen.isHidden = true
        GameOverScreen.isHidden = true
        
    }

    // Opening Screen
    @IBAction func OpeningScreenAction(_ sender: Any) {
        OpeningScreenButton.isHidden = true
        GameScreen.isHidden = false
        newGame()
    }
    
    // Game Screen
    @IBAction func FirstDownButton(_ sender: Any) {
        move(position: 0)
        updateLabels()
    }
    @IBAction func SecondUpButton(_ sender: Any) {
        move(position: 0)
        updateLabels()
    }
    @IBAction func SecondDownButton(_ sender: Any) {
        move(position: 1)
        updateLabels()
    }
    @IBAction func ThirdUpButton(_ sender: Any) {
        move(position: 1)
        updateLabels()
    }
    @IBAction func ThirdDownButton(_ sender: Any) {
        move(position: 2)
        updateLabels()
    }
    @IBAction func FourthUpButton(_ sender: Any) {
        move(position: 2)
        updateLabels()
    }
    @IBAction func NextRoundButton(_ sender: Any) {
        if questionsPerGame > (correctlyAnswered + incorrectlyAnswered) {
            newRound()
        } else {
            GameScreen.isHidden = true
            GameOverScreen.isHidden = false
            ScoreLabel.text = "\(correctlyAnswered)/\(questionsPerGame)"
        }
    }
    
    // Round Screen
    @IBAction func NewGameButton(_ sender: Any) {
        GameOverScreen.isHidden = true
        GameScreen.isHidden = false
        newGame()
    }
    
    // Will check if the device has been shaken
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if questionsPerGame > (correctlyAnswered + incorrectlyAnswered) && cellBeenShaken == false {
                cellBeenShaken = true
                timer.invalidate()
                TimerLabel.isHidden = true
                buttonsEnabeled(false)
                updateNextroundButton()
            } else {
                print("Player shakes the phone for no reason")
            }
        }
    }
    
}

