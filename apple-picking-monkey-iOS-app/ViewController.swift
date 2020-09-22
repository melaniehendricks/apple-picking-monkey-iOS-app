//
//  ViewController.swift
//  apple-picking-monkey-iOS-app
//
//  Created by Melanie Hendricks on 9/14/20.
//  Copyright © 2020 Melanie Hendricks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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


    @IBAction func moveUp(_ sender: Any) {
        
    }
    
    
    @IBAction func moveDown(_ sender: Any) {
        
    }
    
    
    @IBAction func moveLeft(_ sender: Any) {
        
    }
    
    
    @IBAction func moveRight(_ sender: Any) {
        
    }
    
    
    
    
}

