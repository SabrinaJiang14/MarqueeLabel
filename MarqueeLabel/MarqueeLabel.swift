//
//  MarqueeLabel.swift
//  MarqueeLabel
//
//  Created by Sabrina on 2017/4/11.
//  Copyright © 2017年 Sabrina. All rights reserved.
//

import UIKit

class MarqueeLabel: UILabel,CAAnimationDelegate {


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
    private var innerLabel:UILabel = UILabel.init()
    
    required init?(coder aDecoder: NSCoder) {
        self.animation = CABasicAnimation.init()
        self.innerLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
        
        super.init(coder: aDecoder)
        
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
            let constraint:CGSize = CGSize.init(width: 200000, height: 40)
            let attr:NSAttributedString = NSAttributedString.init(string: self.innerText!, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: self.innerSize!)])
            let rect:CGRect = attr.boundingRect(with: constraint, options: .usesLineFragmentOrigin, context: nil)
            let size:CGSize = rect.size
            
            self.innerLabel.frame.size.height = size.height
            
            if size.width > self.frame.size.width{
                self.innerLabel.frame.size.width = size.width
                self.startAnimation()
            }else{
                self.innerLabel.frame.size.width = self.frame.size.width
                self.innerLabel.textAlignment = .center
            }
        }
    }
    
    private func startAnimation(){
        let keyframe = CAKeyframeAnimation.init(keyPath: "position")
        let value1 = NSValue.init(cgPoint: self.innerLabel.layer.position)
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: -(self.innerLabel.frame.size.width - self.innerLabel.layer.position.x - 5), y: self.innerLabel.layer.position.y))
        
        let arr = [value1,value2]
        keyframe.values = arr
        keyframe.duration = 20
        keyframe.repeatCount = HUGE
        keyframe.keyTimes = [0.08,0.92]
        
        self.innerLabel.layer.add(keyframe, forKey: "KCKeyframeAnimation_Position")
        
    }
}
