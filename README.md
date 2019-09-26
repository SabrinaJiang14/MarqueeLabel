# MarqueeLabel
MarqueeLabel is very easy to use label. Using **CABasicAnimation** to implement. 


## Example
Just run the example project, or clone the repo.


## Requirements
* Xcode 10 or above
* iOS 10
* Swift 5


## How to use
- Setp 1. In storyboard, drop a UILabel into viewController.

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/drop_a_UILabel.png "drop_a_UILabel")

- Setp 2. Select [Show the Identity inspector] in right side panel.
- Setp 3. Change class to [MarqueeLabel] in Custom Class

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/Show_the_Identity_inspector.png "Show_the_Identity_inspector")

- Setp 4. Create Referencing Outlets

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/Referencing_Outlets.png "Referencing_Outlets")

- Setp 5. Setting text, font size, and textColor
``` swift
self.demoLabel.innerText = "Last year's bleaching event, the worst on record, mainly affected the north of 
  the reef..."   
self.demoLabel.innerSize = 15
self.demoLabel.innerColor = UIColor.blue
```

- Setp 6. Build and run!

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/demo_vedio.gif "demo")

## Customize property
``` swift
public var innerText: NSString 
// Text
```
``` swift
public var innerSize: CGFloat
// The font size
```
``` swift
public var innerColor: UIColor
// The text foreground color
```
``` swift
public var isShowAllText: Bool
// The flag that you want to show full text or not.
// Default is true
```
``` swift
public var isShowOpacity: Bool
// The flag that you want to fade out strings or not.
// Default is true
```

# Licence
Licence MIT
