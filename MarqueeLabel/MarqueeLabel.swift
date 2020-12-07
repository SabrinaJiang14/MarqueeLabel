//
//  MarqueeLabel.swift
//  MarqueeLabel
//
//  Created by Sabrina on 2017/4/11.
//  Copyright © 2017年 Sabrina. All rights reserved.
//

import UIKit

protocol MarqueeLabelProtocol : NSObjectProtocol {
    func tap(sender:MarqueeLabel)
}

typealias Label = UIView

@dynamicMemberLookup
class MarqueeLabel: Label {
    //MARK: - public property
    var style:LabelStyle? { didSet { setupView() } }
    var delegate:MarqueeLabelProtocol? {
        didSet { self.isUserInteractionEnabled = true }
    }
    
    //MARK: - private property
    private var innerLabel:UILabel = UILabel()
    private let innerLabelPadding:CGFloat = 10
    private var durationTimeInterval:TimeInterval = 0.0
    private var isShowAllText:Bool = true
    private var isShowOpacity:Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    subscript<T>(dynamicMember keypath:ReferenceWritableKeyPath<UILabel, T>) -> T {
        get { innerLabel[keyPath: keypath] }
        set {
            if keypath == \UILabel.numberOfLines { return }
            innerLabel[keyPath: keypath] = newValue
        }
    }
        
    deinit {
        if let animationKeys = self.innerLabel.layer.animationKeys(), animationKeys.count > 0 {
            self.innerLabel.layer.removeAllAnimations()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let animationKeys = self.innerLabel.layer.animationKeys(), animationKeys.count > 0 {
            self.innerLabel.layer.removeAllAnimations()
        }
        
        self.startAnimation()
    }
}

extension MarqueeLabel {
    @objc private func tapEventHandle() {
        delegate?.tap(sender: self)
    }
    
    private func initialize() {
        innerLabel.layer.shouldRasterize = true
        innerLabel.textAlignment = .left
        innerLabel.backgroundColor = .clear
        innerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(innerLabel)
        self.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEventHandle))
        self.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        guard let style = style else { return }
        self.backgroundColor = style.backColor
        self.isShowAllText = style.showFullText
        self.isShowOpacity = style.transparencyInTheEnd
        self.durationTimeInterval = style.duration
    }
    
    private func startAnimation(){
        
        let transform = isShowAllText ? self.getTransformAllX() : self.getTransformX()
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
        
        innerLabel.layer.add(group, forKey: "com.marqueeLabel.animation.group")
    }
    
    private func getTransformAllX() -> CAKeyframeAnimation {
        let newSize = innerLabel.sizeThatFits(CGSize(width: 200000, height: self.frame.height))
        
        NSLayoutConstraint.activate([innerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: innerLabelPadding),
                                     innerLabel.topAnchor.constraint(equalTo: self.topAnchor),
                                     innerLabel.widthAnchor.constraint(equalToConstant: newSize.width),
                                     innerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        let beginPointsX = UIScreen.main.bounds.size.width - innerLabelPadding
        let endPointX = (max(0, (newSize.width - UIScreen.main.bounds.size.width + (innerLabelPadding * 2))))
        
        let transform = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        transform.timingFunctions = [CAMediaTimingFunction(name: .default)]  // array of timing function
        transform.values = [beginPointsX, -endPointX] // taking the animated property values for animation
        transform.keyTimes = [0.0, 0.8]  // define the timing array
        transform.duration = durationTimeInterval // CFTimeInterval
        transform.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        transform.fillMode = .forwards
        transform.repeatCount = 1
        return transform
    }
    
    private func getTransformX() -> CAKeyframeAnimation {
        let newWidth = UIScreen.main.bounds.size.width - innerLabelPadding
        NSLayoutConstraint.activate([innerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: innerLabelPadding),
                                     innerLabel.topAnchor.constraint(equalTo: self.topAnchor),
                                     innerLabel.widthAnchor.constraint(equalToConstant: newWidth),
                                     innerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        let beginPointsX = UIScreen.main.bounds.size.width - innerLabelPadding
        
        let transform = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        transform.timingFunctions = [CAMediaTimingFunction(name: .default)]  // array of timing function
        transform.values = [beginPointsX, 0] // taking the animated property values for animation
        transform.keyTimes = [0.0, 0.8]  // define the timing array
        transform.duration = durationTimeInterval // CFTimeInterval
        transform.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        transform.fillMode = .forwards
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
