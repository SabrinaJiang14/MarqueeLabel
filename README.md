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
// Create new label
let label = MarqueeLabel()

// Set up default style
label.style = DefaultStyle()

// Set up the text using default property
lable.text = "Stay Hungry. Stay Foolish. And I have always wished that for myself."

// Update the text color using default property
label.textColor = .blue

//  Update the text font using default property
label.font = .preferredFont(forTextStyle: .title1)
```

- Setp 6. Build and run!

![GITHUB](https://github.com/SabrinaJiang14/MarqueeLabel/blob/master/Example/demo_vedio.gif "demo")

## Customize property
``` swift
// the style must be init with text
var style1 = DefaultStyle()

// need show full text or not
style1.showFullText = true

// set back color
style1.backColor = .clear

// set whether to end the animation with transparency
style1.opacityInTheEnd = true

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
