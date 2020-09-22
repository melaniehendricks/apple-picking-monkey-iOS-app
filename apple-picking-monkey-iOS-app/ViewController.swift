//
//  ViewController.swift
//  apple-picking-monkey-iOS-app
//
//  Created by Melanie Hendricks on 9/14/20.
//  Copyright © 2020 Melanie Hendricks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // declare variables
    @IBOutlet weak var monkey: UIImageView!
    @IBOutlet weak var apple1: UIImageView!
    @IBOutlet weak var apple2: UIImageView!
    @IBOutlet weak var apple3: UIImageView!
    @IBOutlet weak var apple4: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.monkey.image = UIImage(named: "monkey.jpeg")
        self.apple1.image = UIImage(named: "apple.png")
        self.apple2.image = UIImage(named: "apple.png")
        self.apple3.image = UIImage(named: "apple.png")
        self.apple4.image = UIImage(named: "apple.png")
    }


    // move monkey up 10
    @IBAction func moveUp(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y -= 10
        self.monkey.frame = frame
        
        
        self.viewIntersectsView(monkey, secondView: apple1)
        self.viewIntersectsView(monkey, secondView: apple2)
        self.viewIntersectsView(monkey, secondView: apple3)
        self.viewIntersectsView(monkey, secondView: apple4)
    }
    
    // move monkey down 10
    @IBAction func moveDown(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y += 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1)
        self.viewIntersectsView(monkey, secondView: apple2)
        self.viewIntersectsView(monkey, secondView: apple3)
        self.viewIntersectsView(monkey, secondView: apple4)
    }
    
    // move monkey left 10
    @IBAction func moveLeft(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x -= 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1)
        self.viewIntersectsView(monkey, secondView: apple2)
        self.viewIntersectsView(monkey, secondView: apple3)
        self.viewIntersectsView(monkey, secondView: apple4)
    }
    
    // move monkey right 10
    @IBAction func moveRight(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x += 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1)
        self.viewIntersectsView(monkey, secondView: apple2)
        self.viewIntersectsView(monkey, secondView: apple3)
        self.viewIntersectsView(monkey, secondView: apple4)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // if view1 and view2 intersect, hide view2
    func viewIntersectsView(_ firstView: UIView, secondView: UIView){
        if firstView.frame.intersects(secondView.frame){
            secondView.isHidden = true
        }
        
    }
    
    
    
    // timer function
    
    
    
}

