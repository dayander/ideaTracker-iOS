//
//  ideaCell.swift
//  ideaTracker
//
//  Created by Anderson Day on 10/26/18.
//  Copyright © 2018 Anderson Day. All rights reserved.
//

import Foundation

import UIKit

protocol IdeaCellDelegate {
//    func pauseTapped(_ cell: IdeaCell)
//    func resumeTapped(_ cell: IdeaCell)
//    func cancelTapped(_ cell: IdeaCell)
//    func downloadTapped(_ cell: IdeaCell)
}

class IdeaCell: UITableViewCell {
    
    // Delegate identifies track for this cell,
    // then passes this to a download service method.
    var delegate: IdeaCellDelegate?
    
    @IBOutlet weak var quickTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var progressView: UIProgressView!
//    @IBOutlet weak var progressLabel: UILabel!
//    @IBOutlet weak var pauseButton: UIButton!
//    @IBOutlet weak var cancelButton: UIButton!
//    @IBOutlet weak var downloadButton: UIButton!
    
//    @IBAction func pauseOrResumeTapped(_ sender: AnyObject) {
//        if(pauseButton.titleLabel?.text == "Pause") {
//            delegate?.pauseTapped(self)
//        } else {
//            delegate?.resumeTapped(self)
//        }
//    }
    
//    @IBAction func cancelTapped(_ sender: AnyObject) {
//        delegate?.cancelTapped(self)
//    }
//
//    @IBAction func downloadTapped(_ sender: AnyObject) {
//        delegate?.downloadTapped(self)
//    }
//
    func configure(idea: Idea) {
        quickTitleLabel.text = idea.quickTitle
        //descriptionLabel.text = idea.description
        
        // Show/hide download controls Pause/Resume, Cancel buttons, progress info
        // TODO
        // Non-nil Download object means a download is in progress
        // TODO
        
        // If the track is already downloaded, enable cell selection and hide the Download button
        
    }
    
}

