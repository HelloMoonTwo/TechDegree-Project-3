//
//  GameLogic.swift
//  Bout' Time - US History
//
//  Created by Francisco Luna on 3/12/19.
//  Copyright © 2019 Francisco Luna. All rights reserved.
//

import Foundation

// Containers needed for game logic
var listOfEvents = HistoricEvents()
var randomEvents: [HistoricEventFormat] = [] // Will hold the current round events
var correctlyAnswered: Int = 0
var incorrectlyAnswered: Int = 0
let questionsPerGame = 6
let questionsPerRound = 4
var roundCorrect: Bool?
var cellBeenShaken = false

// Reset functions
func resetScore() {
    correctlyAnswered = 0
    incorrectlyAnswered = 0
}

func resetTestAnswer() {
    roundCorrect = nil
}

func resetRandomEvents() {
    randomEvents = []
}

func resetListOfEvents() {
    listOfEvents = HistoricEvents()
}

func resetRound() {
    resetTestAnswer()
    resetRandomEvents()
}

func resetGame() {
    resetRound()
    resetScore()
    resetListOfEvents()
}

// Function to get 4 random events
func getRandomEvents() {
    randomEvents = []
    while randomEvents.count < questionsPerRound {
        randomEvents.append(listOfEvents.getRandomEvent())
    }
}

// Functions that will move the information of the labels
func move(position: Int) {
    let placeHolder = randomEvents[position]
    randomEvents.remove(at: position)
    randomEvents.insert(placeHolder, at: position + 1)
}

// Function to test if the round is correct
// Will check to see if the player placed the answer from top to down or down to top
func testIfCorrect() {
    let userOrdered = [randomEvents[0].year, randomEvents[1].year, randomEvents[2].year, randomEvents[3].year] // Will get the years of how the player ordered the events to make easier to test for
    let sorted = userOrdered.sorted() // Will sort the years in oldest to newest
    let reverse: [Int] = sorted.reversed() // Will sort the year newest to oldest
    
    // Test if events were ordered correctly, adds a point to either correct or incorrect container
    if userOrdered == sorted || userOrdered == reverse {
        correctlyAnswered += 1
        roundCorrect = true
    } else {
        incorrectlyAnswered += 1
        roundCorrect = false
    }
}
