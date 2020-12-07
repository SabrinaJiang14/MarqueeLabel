//
//  DefaultValue.swift
//  MarqueeLabel
//
//  Created by sabrina on 2020/11/25.
//  Copyright © 2020 Sabrina. All rights reserved.
//

import UIKit
@propertyWrapper
struct Default<T : Equatable> {
    private var value : T
    
    init(_ value: T) {
        self.value = value
    }
    
    var wrappedValue: T {
        get { return value }
        set { value = newValue }
    }
}

extension Bool {
    enum False {
        
    }
}

@propertyWrapper
struct False {
    private var value : Bool
    init() {
        self.value = false
    }
    var wrappedValue : Bool {
        get { return value }
        set { value = newValue }
    }
}

@propertyWrapper
struct True {
    private var value : Bool
    init() {
        self.value = true
    }
    var wrappedValue : Bool {
        get { return value }
        set { value = newValue }
    }
}

@propertyWrapper
struct Color {
    private var value : UIColor
    init(value:UIColor) {
        self.value = value
    }
    
    var wrappedValue : UIColor {
        get { return value }
        set { value = newValue }
    }
}

@propertyWrapper
struct Interval {
    private var value : TimeInterval
    init(value:TimeInterval) {
        self.value = value
    }
    var wrappedValue : TimeInterval {
        get { return value }
        set { value = newValue }
    }
}

protocol LabelStyle {
    /** Set up Label backgeround color, default color is clear. */
    var backColor:UIColor { get }
    
    /** Show all text in label, default is false. */
    var showFullText:Bool { get set }
    
    /** Show transparency in animation end, default is false. */
    var transparencyInTheEnd:Bool { get }
    
    /** Animation interval, default is 0. */
    var duration:TimeInterval { get }
}

struct DefaultStyle : LabelStyle {
    
    @Default(UIColor.clear) var backColor: UIColor
    
    @False var showFullText: Bool
    @Default(false) var transparencyInTheEnd: Bool
    
    @Interval(value: 5) var duration: TimeInterval
}
