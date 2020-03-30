//
//  matchingGame.swift
//  ios0330
//
//  Created by student on 2020/3/30.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation

class MatchingGame    {
    
    var cards=Array<Card>()
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    
    func chooseCard2(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp=false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }//matched
                cards[index].isFaceUp = true
                //indexOfOneAndOnlyFaceUpCard = nil
            }else if let matchIndex1 = indexOfOneAndOnlyFaceUpCard, matchIndex1 == index{
                cards[index].isFaceUp = false
                
            }
                // has another previous card face up
            else{//no cards face up or 2 cards are face up
                //for flipDownIndex in cards.indices{
                //    cards[flipDownIndex].isFaceUp = false
                //}// all cards set back to face down
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        // TODO: Shuffle Cards
    }
}
