//
//  Idea.swift
//  ideaTracker
//
//  Created by Anderson Day on 10/25/18.
//  Copyright © 2018 Anderson Day. All rights reserved.
//

import Foundation

import Foundation.NSURL

// Query service creates Track objects
class Idea {
    var id: String
    var quickTitle: String
    var description: String
    var ideaURL: String
    var priority: String
    var downloaded = false
    
    init(id:String, quickTitle: String, description: String, ideaURL: String, priority: String) {
        
        self.id = id
        self.quickTitle = quickTitle
        self.description = description
        self.ideaURL = ideaURL

        self.priority = priority
    }
    
}

