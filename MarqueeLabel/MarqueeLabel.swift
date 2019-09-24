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
                self.setup()
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
                self.setup()
            }
        }
    }
    
    var isShowAllText:Bool? = true {
        willSet{
            self.isShowAllText = newValue
        }
        didSet {
            if self.isShowAllText != nil {
                self.setup()
            }
        }
    }
    var isShowOpacity:Bool = true {
        willSet {
            self.isShowOpacity = newValue
        }
        didSet {
            self.setup()
        }
    }
    
    private var innerLabel:UILabel = UILabel()
    private let innerLabelheight:CGFloat = 40.0
    private let innerLabelPadding:CGFloat = 10
    private let durationTimeInterval:TimeInterval = 5.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    deinit {
        print("== deinit ==")
    }
    
    private func initialize() {
        self.innerLabel = UILabel(frame: CGRect(x: innerLabelPadding, y: 0, width: UIScreen.main.bounds.size.width - (innerLabelPadding * 2), height: innerLabelheight))
        self.innerLabel.frame.size.height = self.frame.height
        self.innerLabel.textAlignment = .left
        self.addSubview(self.innerLabel)
        
        self.layer.masksToBounds = true
    }
    
    private func setup(){
        self.text = ""
        if self.innerLabel.layer.animationKeys() != nil {
            if (self.innerLabel.layer.animationKeys()?.count)! > 0 {
                self.innerLabel.layer.removeAllAnimations()
            }
        }
        
        if !(self.innerText?.isEmpty)! {
            self.startAnimation()
        }
    }
    
    private func startAnimation(){
        
        let transform = isShowAllText! ? self.getTransformAllX() : self.getTransformX()
        var animations:[CAAnimation] = [transform]
        
        if isShowOpacity {
            let opacity = self.getOpacity()
            animations.append(opacity)
        }
        
        let group = CAAnimationGroup()
        group.animations = animations
        group.duration = durationTimeInterval
        group.repeatCount = Float.infinity
        group.isRemovedOnCompletion = false
        group.fillMode = .removed
        
        innerLabel.layer.add(group, forKey: "doit")
    }
    
    private func getTransformAllX() -> CAKeyframeAnimation {
        let newSize = innerLabel.sizeThatFits(CGSize(width: 200000, height: innerLabelheight))
        innerLabel.frame.size.width = newSize.width
        
        let beginPointsX = UIScreen.main.bounds.size.width - innerLabelPadding
        let endPointX =  (max(0, (newSize.width - UIScreen.main.bounds.size.width + (innerLabelPadding * 2))))
        
        let transform = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        transform.timingFunctions = [CAMediaTimingFunction(name: .default)]  // array of timing function
        transform.values = [beginPointsX, -endPointX] // taking the animated property values for animation
        transform.keyTimes = [0.0, 0.8]  // define the timing array
        transform.duration = durationTimeInterval // CFTimeInterval
        transform.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        transform.fillMode = CAMediaTimingFillMode.forwards
        transform.repeatCount = 1
        return transform
    }
    
    private func getTransformX() -> CAKeyframeAnimation {
        innerLabel.frame.size.width = UIScreen.main.bounds.size.width - innerLabelPadding
        
        let beginPointsX = UIScreen.main.bounds.size.width - innerLabelPadding
        
        let transform = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        transform.timingFunctions = [CAMediaTimingFunction(name: .default)]  // array of timing function
        transform.values = [beginPointsX, 0] // taking the animated property values for animation
        transform.keyTimes = [0.0, 0.8]  // define the timing array
        transform.duration = durationTimeInterval // CFTimeInterval
        transform.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        transform.fillMode = CAMediaTimingFillMode.forwards
        transform.repeatCount = 1
        return transform
    }
    
    private func getOpacity() -> CAKeyframeAnimation {
        let opacity = CAKeyframeAnimation(keyPath: "opacity")
        opacity.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        opacity.duration = durationTimeInterval
        opacity.keyTimes = [0.0, 0.1, 0.9, 1.0]
        opacity.values = [0.0, 1.0, 1.0, 0.0]
        return opacity
    }
}
