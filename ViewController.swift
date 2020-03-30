//
//  ViewController.swift
//  ios0330
//
//  Created by student on 2020/3/30.
//  Copyright © 2020年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame(numberOfPairsOfCards: (deck.count+1) / 2)
    
    @IBAction func startGame(_ sender: UIButton) {
        for index in deck.indices{
            deck[index].setTitle("", for: UIControlState.normal)
            deck[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        //sender.setTitle("", for: UIControl.State.normal)
        //sender.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0)
    }
    
    @IBOutlet var deck: [UIButton]!
    
    @IBOutlet weak var flipCounter: UILabel!
    var flips = 0{
        didSet{
            //flipCounter.text = "Flips: \(flips)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = deck.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("This card is not in the collection!")
        }
        flips+=1
    }
    
    func updateViewFromModel(){
        for index in deck.indices{
            let button = deck[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.6965228873) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var emojiChoices = ["👻","🎃","😈","🦇","🙀","⚽️","🌏","♥️"]
    var emojiDict = Dictionary<Int,String>()
    
    func emoji(for card: Card)->String{
        if emojiDict[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDict[card.identifier] ?? "?"
    }

}

