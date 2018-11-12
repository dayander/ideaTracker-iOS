//
//  DetailedIdeaViewController.swift
//  ideaTracker
//
//  Created by Anderson Day on 11/7/18.
//  Copyright © 2018 Anderson Day. All rights reserved.
//

import UIKit



class DetailedIdeaViewController: UIViewController, UITextFieldDelegate {
    var ideaQuickTitle = ""
    var ideaDescription = ""
    
    
    @IBOutlet weak var quickTitleTextEdit: UITextView!
  
    @IBOutlet weak var descriptionTextEdit: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        quickTitleTextEdit.text = ideaQuickTitle
        descriptionTextEdit.text = ideaDescription
        
       quickTitleTextEdit.isEditable = false
        
        descriptionTextEdit.isEditable = false
        //quickTitleTextEdit.allowsEditingTextAttributes = false
        
        
//        quickTitleTextEdit.delegate = self
//        quickTitleTextEdit.isHidden = true
//        quickTitleLabel.isUserInteractionEnabled = true
////        let aSelector = Selector(("quickTitleLabeledTapped"))
//        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
//        tapGesture.numberOfTapsRequired = 1
//        quickTitleLabel.addGestureRecognizer(tapGesture)
        
        

    }
    
    
    @objc func quickTitleLabeledTapped(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case UIGestureRecognizer.State.began:
            print("begin")
            break;
        case UIGestureRecognizer.State.ended:
            print("ended")
            break
        // Implementation here...
        default: break
        }
    
    
    }
}
