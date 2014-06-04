//
//  ViewController.swift
//  BlurTest
//
//  Created by Ben Dodson on 03/06/2014.
//  Copyright (c) 2014 Ben Dodson Apps. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var ball = UIImageView()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        UIApplication.sharedApplication().setStatusBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ball = UIImageView(frame: CGRectMake(0, 0, 150, 150))
        ball.image = UIImage(named: "Ben")
        ball.clipsToBounds = true
        ball.center = view.center
        ball.layer.cornerRadius = 75
        view.addSubview(ball)
        
        var displayLink = CADisplayLink(target: self, selector: "displayLinkUpdated:")
        displayLink.frameInterval = 30
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var blurView = UIVisualEffectView(effect: effect)
        blurView.frame = CGRectMake(0, 0, 300, 300)
        blurView.center = view.center
        view.addSubview(blurView)

        var label = UILabel(frame: CGRectMake(0, 0, 300, 300))
        label.font = UIFont.systemFontOfSize(50)
        label.text = "Testing"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        blurView.contentView.addSubview(label)
    }
    
    
    func displayLinkUpdated(displayLink: CADisplayLink) {
        var x = Float(ball.frame.origin.x)
        var y = Float(ball.frame.origin.y)
        
        var rand: Float = 0.0
        
        rand = Float(arc4random_uniform(300))
        rand -= 150
        x = x + rand
        if x < 300 {
            x = 300
        }
        if x > 700 {
            x = 700
        }
        
        rand = Float(arc4random_uniform(300))
        rand -= 150
        y = y + rand
        if y < 200 {
            y = 200
        }
        if y > 600 {
            y = 600
        }
        
        rand = Float(arc4random_uniform(20)+10)
        rand /= 10

        
        UIView.animateWithDuration(0.5, animations: {
            self.ball.frame = CGRectMake(CGFloat(x), CGFloat(y), self.ball.frame.width, self.ball.frame.height)
            self.ball.transform = CGAffineTransformMakeScale(CGFloat(rand), CGFloat(rand))
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

