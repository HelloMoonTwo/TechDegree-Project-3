//
//  HistoricEvents.swift
//  Bout' Time - US History
//
//  Created by Francisco Luna on 3/12/19.
//  Copyright © 2019 Francisco Luna. All rights reserved.
//

import GameKit

struct HistoricEventFormat {
    var event: String
    var year: Int
}

// Container for historic events
struct HistoricEvents {
    var events: [HistoricEventFormat] = [
        HistoricEventFormat(event: "Jamestown, Virginia founded",
                            year: 1607),
        HistoricEventFormat(event: "The First Continental Congress is formed",
                            year: 1774),
        HistoricEventFormat(event: "The Colonies declare independence with the Declaration of Independence",
                            year: 1776),
        HistoricEventFormat(event: "Britain accepts lossing the colonies",
                            year: 1783),
        HistoricEventFormat(event: "The Founding Father form the constitution",
                            year: 1787),
        HistoricEventFormat(event: "George Washington is elected as the first president",
                            year: 1789),
        HistoricEventFormat(event: "Bill of Rights created to guarantee individual freedom",
                            year: 1791),
        HistoricEventFormat(event: "The USA buys the Louisiana territories from France",
                            year: 1803),
        HistoricEventFormat(event: "Atlantic slave trade is abolished",
                            year: 1808),
        HistoricEventFormat(event: "USA gets a lot of territory after the Mexican War",
                            year: 1848),
        HistoricEventFormat(event: "Republican Party formed in opposition of slavery",
                            year: 1854),
        HistoricEventFormat(event: "Abraham Lincoln gets elected president",
                            year: 1860),
        HistoricEventFormat(event: "x11 States secede from the Union and trigger the Civil War",
                            year: 1861),
        HistoricEventFormat(event: "Confederates defeated and slavery abolished",
                            year: 1865),
        HistoricEventFormat(event: "Women are given the right to vote",
                            year: 1920),
        HistoricEventFormat(event: "Indigenous people given right to citizenship by Congress",
                            year: 1924),
        HistoricEventFormat(event: "The Great Depression is triggered after the Wall Street Stock Market crashed",
                            year: 1929),
        HistoricEventFormat(event: "President Franklin D. Roosevelt launches the New Deal to help recover from the Great Depression",
                            year: 1933),
        HistoricEventFormat(event: "Japanese attack the US at Pearl Harbour, causing the US to joing the war",
                            year: 1941),
        HistoricEventFormat(event: "The US drops atomic bombs on Hiroshima and Nagasaki, Japan causing them to surrender",
                            year: 1945),
        HistoricEventFormat(event: "The Cold War begins with the Soviet Union",
                            year: 1947),
        HistoricEventFormat(event: "McCarthyism is enacted to get communists out of the government and public life.",
                            year: 1950),
        HistoricEventFormat(event: "Racial segregation in schools becomes unconstitutional",
                            year: 1954),
        HistoricEventFormat(event: "The unsuccessful invation of Cuba became known as the Bay of Pigs",
                            year: 1961),
        HistoricEventFormat(event: "John F. Kennedy is assassinated",
                            year: 1963),
        HistoricEventFormat(event: "Civil Rights Act Signed to stop dicriminaiton from race, color, religion, or nationality",
                            year: 1964),
        HistoricEventFormat(event: "Martin Luther King assassinated, a major black civil rights leader.",
                            year: 1968),
        HistoricEventFormat(event: "Neil Armstrong walks on the Moon",
                            year: 1969),
        HistoricEventFormat(event: "Vietnam ceasefire agreement signed after about 58K American soldiers lives were lost",
                            year: 1973),
        HistoricEventFormat(event: "444 held hostage in the US embassy in Tehran, Iran",
                            year: 1979),
        HistoricEventFormat(event: "Ronald Reagan elected president and adopts a tough anti-comunist policy",
                            year: 1980),
        HistoricEventFormat(event: "War on Terror starts in response to the terrorist attack on the Twin Tower",
                            year: 2001),
        HistoricEventFormat(event: "Hurricane Katrina becomes the worst natrual disaster in US history",
                            year: 2005),
        HistoricEventFormat(event: "Barack Obama becomes the first black president in the US",
                            year: 2008),
        HistoricEventFormat(event: "US kills the leader of Al-Qaeda",
                            year: 2011),
        HistoricEventFormat(event: "Edward Snowden leaks information on how the US gathers intelligence",
                            year: 2013),
        HistoricEventFormat(event: "Death of unarmed black teenager by a white policeman sparks riots in Ferguson Missouri",
                            year: 2014),
        HistoricEventFormat(event: "A black church is shot up by terrorist in Charleston and in San Bernandino 14 people were killed, 21 others wounded in Islamist extremist terrorist attack",
                            year: 2015),
        HistoricEventFormat(event: "President Trump inacts two polices banning flights to Muslim countries and funding for cities that shelter illegal immigrants",
                            year: 2017),
        HistoricEventFormat(event: "President Trump talks with Kim Jong-un working together to reduce tension in the Korean peninsula",
                            year: 2018)]
    
    // Gets a random event and removes it from the list
    mutating func getRandomEvent() -> HistoricEventFormat {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: self.events.count)
        let randomEvent = events[randomNumber]
        self.events.remove(at: randomNumber)
        return randomEvent
    }
}
