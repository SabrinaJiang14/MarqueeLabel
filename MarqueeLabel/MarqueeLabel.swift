//
//  MarqueeLabel.swift
//  MarqueeLabel
//
//  Created by Sabrina on 2017/4/11.
//  Copyright © 2017年 Sabrina. All rights reserved.
//

import UIKit

class MarqueeLabel: UILabel {
    var innerText:String? {
        willSet {
            self.innerText = newValue
        }
        didSet {
            self.innerLabel.text = self.innerText
            if self.innerSize != nil{
                self.setLabelWith()
            }
        }
    }
    
    
    var innerColor:UIColor? {
        willSet {
            self.innerColor = newValue
        }
        didSet {
            self.innerLabel.textColor = self.innerColor
        }
    }
    
    var innerSize:CGFloat? {
        willSet {
            self.innerSize = newValue
        }
        didSet {
            self.innerLabel.font = UIFont.systemFont(ofSize: self.innerSize!)
            if self.innerText != nil {
                self.setLabelWith()
            }
        }
    }
    
    private var animation:CABasicAnimation
    private var innerLabel:UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        self.animation = CABasicAnimation.init()
        self.innerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 45, height: 46))
        
        super.init(coder: aDecoder)
        
        self.innerLabel.textAlignment = .left
        self.addSubview(self.innerLabel)
        
        self.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        self.animation = CABasicAnimation()
        
        self.innerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 45, height: 46))
        super.init(frame: frame)
        self.innerLabel.textAlignment = .left
        self.addSubview(self.innerLabel)
        
        self.layer.masksToBounds = true
    }
    
    private func setLabelWith(){
        self.text = ""
        if self.innerLabel.layer.animationKeys() != nil {
            if (self.innerLabel.layer.animationKeys()?.count)! > 0 {
                self.innerLabel.layer.removeAllAnimations()
            }
        }
        
        if !(self.innerText?.isEmpty)! {
//            let constraint:CGSize = CGSize(width: 200000, height: 40)
//            let attr:NSAttributedString = NSAttributedString(string: self.innerText!, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: self.innerSize!)])
//            let rect:CGRect = attr.boundingRect(with: constraint, options: .usesLineFragmentOrigin, context: nil)
//            let size:CGSize = rect.size
//
//            innerLabel.frame.size.width = size.width
            self.startAnimation()
        }
    }
    
    private func startAnimation(){

        let beginPointsX = UIScreen.main.bounds.size.width - 30
        let values = [beginPointsX, 0]
        let times : [NSNumber] = [0.0, 1.0] // not necessary always
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        animation.timingFunctions = [CAMediaTimingFunction(name: .default)]  // array of timing function
        animation.values = values // taking the animated property values for animation
        animation.keyTimes = times // define the timing array
        animation.duration = 5.0 // CFTimeInterval
        animation.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.repeatCount = 1
        
        let opacity = CAKeyframeAnimation(keyPath: "opacity")
        opacity.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        opacity.duration = 5.0
        opacity.keyTimes = [0.0, 0.1, 0.9, 1.0]
        opacity.values = [0.0, 1.0, 1.0, 0.0]
        
        let group = CAAnimationGroup()
        group.animations = [animation, opacity]
        group.duration = 5.0
        group.repeatCount = Float.infinity
        group.isRemovedOnCompletion = false
        group.fillMode = .removed
        
        innerLabel.layer.add(group, forKey: "doit")
    }
}
