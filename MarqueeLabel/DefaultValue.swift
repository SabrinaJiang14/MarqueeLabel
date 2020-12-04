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
struct Font {
    private var value : UIFont
    init(value:UIFont) {
        self.value = value
    }
    var wrappedValue : UIFont {
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
    var text:String { get set }
    var textColor:UIColor { get }
    var backColor:UIColor { get }
    var showFullText:Bool { get set }
    var transparencyInTheEnd:Bool { get }
    var font:UIFont { get }
    var duration:TimeInterval { get }
}

struct DefaultStyle : LabelStyle {
    
    var text: String
    
    @Color(value: .black) var textColor: UIColor
    @Default(UIColor.clear) var backColor: UIColor
    
    @False var showFullText: Bool
    @Default(false) var transparencyInTheEnd: Bool
    
    @Font(value: .systemFont(ofSize: 15)) var font: UIFont
    @Interval(value: 5) var duration: TimeInterval
}
