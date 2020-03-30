//
//  card.swift
//  ios0330
//
//  Created by student on 2020/3/30.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var idFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        idFactory += 1
        return idFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
