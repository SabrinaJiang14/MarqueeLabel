# MarqueeLabel
MarqueeLabel is very easy to use label. Using **CABasicAnimation** to implement. 


## Example
Just run the example project, or clone the repo.


## Requirements
* Xcode 12 or above
* iOS 14
* Swift 5


## How to use
- Setp 1. In storyboard, drop a UILabel into viewController.

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/drop_a_UILabel.png "drop_a_UILabel")

- Setp 2. Select [Show the Identity inspector] in right side panel.
- Setp 3. Change class to [MarqueeLabel] in Custom Class

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/Show_the_Identity_inspector.png "Show_the_Identity_inspector")

- Setp 4. Create Referencing Outlets

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/Referencing_Outlets.png "Referencing_Outlets")

- Setp 5. Setting text
``` swift
self.demoLabel.style = DefaultStyle(text: "Stay Hungry. Stay Foolish.")

```

- Setp 6. Build and run!

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/demo_vedio.gif "demo")

## Customize property
``` swift
// the style must be init with text
var style1 = DefaultStyle(text: "Stay Hungry. Stay Foolish.")

// need show full text or not
style1.showFullText = true

// set text color
style1.textColor = .blue

// set back color
style1.backColor = .clear

// set whether to end the animation with transparency
style1.opacityInTheEnd = true

// set text font
style1.font = UIFont.boldSystemFont(ofSize: 15)

// set marquee time
style1.duration = 10
```

## New Feature
Implement this protocol if you need tap event, like as:
``` swift
self.demoLabel.delegate = self

extension ViewController:MarqueeLabelProtocol {
    func tap(sender: MarqueeLabel) {
       	//Do something...
    }
}
```


# Licence
Licence MIT
