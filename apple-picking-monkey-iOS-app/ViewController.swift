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
    var appleCount:Int = 0
    var identifierList:[Int] = []

    var timer:Timer?
    var counter = 0
    @IBOutlet weak var timerValLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.monkey.image = UIImage(named: "monkey.jpeg")
        self.apple1.image = UIImage(named: "apple.png")
        self.apple2.image = UIImage(named: "apple.png")
        self.apple3.image = UIImage(named: "apple.png")
        self.apple4.image = UIImage(named: "apple.png")
        
        // create Timer instance
        timer = Timer()
    }

    
    // MARK: - HOW TO PLAY BUTTON - UIALERT
    
    @IBAction func howToPlay(_ sender: Any) {
        let alert = UIAlertController(title: "Rules", message: "Use the arrows to help Marvin move around the screen. Pick up all the apples within 10 seconds to win the game! When you're ready, press Start Game.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_)
            in print("You selected Ok")
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - START GAME BUTTON
    @IBAction func startGame(_ sender: Any) {
        self.timerValLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        
    }
    

    // Helper function
    @objc func count(){
        counter += 1
        let hours = Int(counter) / 3600
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        timerValLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
        print(seconds)
        print("apple count: ", appleCount)
        // if all apples have been collected in 10s or less,
        // player wins, timer stops
        if seconds <= 10 && appleCount == 4{
            timer?.invalidate()
            
            let alert = UIAlertController(title: "YOU WON!", message: "Congratulations! You've helped Marvin collect all the apples in time!", preferredStyle: .alert)
            
            // user can start new game or select Ok
            alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: {action in
                self.newGame()
            }))
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
            
            // if > 10 seconds,
            // player loses, time stops
        }else{
            if seconds > 10{
                timer?.invalidate()
                
                let alert = UIAlertController(title: "YOU LOST", message: "Drink some coffee and try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: { action in
                    self.newGame()
                }))
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    

    
    // MARK: - DIRECTION FUNCTIONS
    
    // move monkey up 10
    @IBAction func moveUp(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y -= 10
        self.monkey.frame = frame
        
        
        self.viewIntersectsView(monkey, secondView: apple1, 1)
        self.viewIntersectsView(monkey, secondView: apple2, 2)
        self.viewIntersectsView(monkey, secondView: apple3, 3)
        self.viewIntersectsView(monkey, secondView: apple4, 4)
    }
    
    // move monkey down 10
    @IBAction func moveDown(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y += 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1, 1)
        self.viewIntersectsView(monkey, secondView: apple2, 2)
        self.viewIntersectsView(monkey, secondView: apple3, 3)
        self.viewIntersectsView(monkey, secondView: apple4, 4)
    }
    
    // move monkey left 10
    @IBAction func moveLeft(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x -= 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1, 1)
        self.viewIntersectsView(monkey, secondView: apple2, 2)
        self.viewIntersectsView(monkey, secondView: apple3, 3)
        self.viewIntersectsView(monkey, secondView: apple4, 4)
    }
    
    // move monkey right 10
    @IBAction func moveRight(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x += 10
        self.monkey.frame = frame
        
        self.viewIntersectsView(monkey, secondView: apple1, 1)
        self.viewIntersectsView(monkey, secondView: apple2, 2)
        self.viewIntersectsView(monkey, secondView: apple3, 3)
        self.viewIntersectsView(monkey, secondView: apple4, 4)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - IF MONKEY PICKS UP AN APPLE, HIDE IT, INCREMENT COUNTER
    
    // if view1 and view2 intersect, hide view2
    func viewIntersectsView(_ firstView: UIView, secondView: UIView, _ identifier: Int){
        var matchCheck:Bool = false
        
        if firstView.frame.intersects(secondView.frame){
            secondView.isHidden = true
            
            // if there are no numbers in list, add identifier + increment appleCount
            if identifierList.isEmpty{
                identifierList.append(identifier)
                appleCount += 1
                
                // if list is not empty, check if identifier is already in list
            }else{
                for id in identifierList{
                    if id == identifier{
                        matchCheck = true
                        break
                        
                    }
                }
                
                // if identifier is not in list, add it + increment appleCount
                if matchCheck == false{
                    identifierList.append(identifier)
                    appleCount += 1
                }
            }
        }
    }
        
    
    // MARK: - START NEW GAME UIALERT OPTION
    func newGame(){
        counter = 0
        appleCount = 0
        identifierList.removeAll()
        self.monkey.frame.origin.x = 26.0
        self.monkey.frame.origin.y = 179.0
        self.apple1.isHidden = false
        self.apple2.isHidden = false
        self.apple3.isHidden = false
        self.apple4.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
    }
    
}

