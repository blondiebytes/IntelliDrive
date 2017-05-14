//
//  StartViewController.swift
//  IntelliDrive
//
//  Created by Kathryn Hodge on 5/13/17.
//  Copyright © 2017 blondiebytes. All rights reserved.
//

import Foundation
import UIKit

class StartViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var inputTextView: UITextView!
    
    // Logic
    var didChangeYet:Bool = false
    var changingText:Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad();
        self.inputTextView.delegate = self
        
    }
    
    @IBAction func pressedGoButton(_ sender: Any) {
        
    }
    
    // Text View Set Up
    
    func textViewDidChange(_ textView: UITextView) {
        if (!didChangeYet) {
            didChangeYet = true
            textView.text = ""
        }
        if (self.changingText) {
            self.changingText = false;
            textView.text = ""
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            print("sending call")
            // send to api.ai
            if ((self.inputTextView.text) != nil) {
                
            } else {
                self.changingText = true;
            }
            
        }
        return true;
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }

    
}
