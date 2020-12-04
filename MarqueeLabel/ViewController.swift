//
//  ViewController.swift
//  MarqueeLabel
//
//  Created by Sabrina on 2017/4/11.
//  Copyright © 2017年 Sabrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoLabel: MarqueeLabel!
    @IBOutlet weak var demoLabel2: MarqueeLabel!
    @IBOutlet weak var demoLabel3: MarqueeLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var style1 = DefaultStyle(text: "Stay Hungry. Stay Foolish. And I have always wished that for myself. And now, as you graduate to begin anew, I wish that for you.")
        style1.showFullText = true
        style1.textColor = .blue
        style1.transparencyInTheEnd = true
        style1.font = UIFont.boldSystemFont(ofSize: 15)
        style1.duration = 10
        self.demoLabel.style = style1
        self.demoLabel.delegate = self
        
        let style2 = DefaultStyle(text: "Stay Hungry. Stay Foolish.")
        self.demoLabel2.style = style2
        self.demoLabel2.delegate = self
        
        var style3 = DefaultStyle(text: "Stay Hungry. Stay Foolish. And I have always wished that for myself. And now, as you graduate to begin anew, I wish that for you.")
        style3.backColor = .blue
        style3.textColor = .white
        style3.font = .preferredFont(forTextStyle: .title1)
        self.demoLabel3.style = style3
        
        let label = MarqueeLabel(frame: CGRect(x: 0, y: 650, width: UIScreen.main.bounds.width, height: 40))
        self.view.addSubview(label)
        label.style = style2
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = .green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:MarqueeLabelProtocol {
    func tap(sender: MarqueeLabel) {
        if let style = sender.style {
            print(style.text)
        }
    }
}
