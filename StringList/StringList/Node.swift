//
//  Node.swift
//  StringList
//
//  Created by Michael Romero on 11/3/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class Node
{
    var data: Character!
    var next: Node!
    
    init(dat: Character)
    {
        data = dat
        next = nil
    }
}
