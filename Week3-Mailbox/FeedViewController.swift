//
//  FeedViewController.swift
//  Week3-Mailbox
//
//  Created by Erin Yang on 9/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var feedScroll: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var messageContainer: UIView!
    @IBOutlet weak var rescheduleImg: UIImageView!
    
    var orgMsgCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScroll.contentSize = CGSize(width: 320, height: 601)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        
        var velocity = sender.velocityInView(view)
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        
        messageView.frame.origin.x = translation.x
        
        println("location x: \(location.x)")
        println("translation x: \(translation.x)")
        println("state : \(sender.state.toRaw())")
        
        
        
        if (sender.state == UIGestureRecognizerState.Began){
            println("pan began")
            self.orgMsgCenter = messageView.center
            messageContainer.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
            
            
            
            // on Pan changed
        } else if (sender.state == UIGestureRecognizerState.Changed){
            println("pan changed")
            
            
            // if little
            if messageView.frame.origin.x < 0 && messageView.frame.origin.x > -60 {
                laterIcon.alpha = 0.2
                messageContainer.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
                
            }
                
                
                
                // if little more
            else if messageView.frame.origin.x < -60 && messageView.frame.origin.x > -260 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.messageContainer.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 77/255, alpha: 1.0)
                    self.laterIcon.alpha = 1
                    }, completion: nil)
                
                laterIcon.frame.origin.x = messageView.frame.origin.x + 340
            }
                
                
                
                // if lots more
            else if messageView.frame.origin.x < -260 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.messageContainer.backgroundColor = UIColor (red: 189/255, green: 164/255, blue: 135/255, alpha: 1.0)
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 1
                    }, completion: nil)
                
                listIcon.frame.origin.x = messageView.frame.origin.x + 340
                
                
            }
            
            
            // swipe to right side
            
            // if little
            if messageView.frame.origin.x > 0  && messageView.frame.origin.x < 60 {
                archiveIcon.alpha = 0.2
                messageContainer.backgroundColor = UIColor(red: 48/255, green: 211/255, blue: 182/255, alpha: 1.0)
                
            }
                
                
                
                // if little more
            else if messageView.frame.origin.x > 60 && messageView.frame.origin.x < 260 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.messageContainer.backgroundColor = UIColor(red: 248/255, green: 14/255, blue: 93/255, alpha: 1.0)
                    self.archiveIcon.alpha = 1
                    }, completion: nil)
                
                archiveIcon.frame.origin.x = messageView.frame.origin.x - 45
            }
                
                
                
                // if lots more
            else if messageView.frame.origin.x > 260 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.messageContainer.backgroundColor = UIColor (red: 189/255, green: 164/255, blue: 135/255, alpha: 1.0)
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 1
                    }, completion: nil)
                
                deleteIcon.frame.origin.x = messageView.frame.origin.x - 45
                
                
            }
            
            
            
        }
          
            
   
        
            
            
            // on Pan end
        else if sender.state == UIGestureRecognizerState.Ended {
            println("pan ended")
            
           UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.messageView.frame.origin.x = 0
            })
       
            }

        if messageView.frame.origin.x < -270 {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
             self.rescheduleImg.alpha = 1
                
            })
        }
        
        
        
        
            
        }
        
        // if a little
        //if(messageView.center.x > 60){
        // UIView.animateWithDuration(0.3, animations: { () -> Void in
        //self.messageView.center.x = self.messageView.center.x + 320
        //}, completion: { (finished: Bool) -> Void in
        // self.feedView.center.y = self.feedView.center.y + self.feedView.center.y + self.messageView.frame.height
        
        // })
        
        //}
        
        //}
        
        
        
        
        
        
        
        
        
        /*
        // MARK: - Navigation
        
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
        */
        
}
