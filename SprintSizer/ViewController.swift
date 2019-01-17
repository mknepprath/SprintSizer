//
//  ViewController.swift
//  SprintSizer
//
//  Created by Michael Knepprath on 1/11/19.
//  Copyright © 2019 Michael Knepprath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sizeLabels = ["S", "M", "L", "XL"]
    
    let sizeColors = ["#6C969D", "#645E9D", "#392B58", "#2D0320"]
    
    var sizeIndex = 0
    
    @IBOutlet weak var sizeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        sizeIndex = Int.random(in: 0 ... 3)
        sizeText.text = sizeLabels[sizeIndex]
        self.view.backgroundColor = UIColor(hexString: sizeColors[sizeIndex])
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right || gesture.direction == UISwipeGestureRecognizer.Direction.up {
            if sizeIndex == 0 {
                sizeIndex = 3
            } else {
                sizeIndex = sizeIndex - 1
            }
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left || gesture.direction == UISwipeGestureRecognizer.Direction.down {
            if sizeIndex == 3 {
                sizeIndex = 0
            } else {
                sizeIndex = sizeIndex + 1
            }
        }
        
        sizeText.text = sizeLabels[sizeIndex]
        self.view.backgroundColor = UIColor(hexString: sizeColors[sizeIndex])
    }
}

