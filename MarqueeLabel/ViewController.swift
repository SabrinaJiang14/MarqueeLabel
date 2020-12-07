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
        
        var style1 = DefaultStyle()
        style1.showFullText = true
        style1.transparencyInTheEnd = true
        style1.duration = 10
        self.demoLabel.style = style1
        self.demoLabel.text = "Stay Hungry. Stay Foolish. And I have always wished that for myself. And now, as you graduate to begin anew, I wish that for you."
        self.demoLabel.textColor = .blue
        self.demoLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.demoLabel.delegate = self
        
        let style2 = DefaultStyle()
        self.demoLabel2.style = style2
        self.demoLabel2.text = "Stay Hungry. Stay Foolish. "
        self.demoLabel2.delegate = self
        
        var style3 = DefaultStyle()
        style3.backColor = .blue
        style3.showFullText = true
        self.demoLabel3.style = style3
        self.demoLabel3.text = "Stay Hungry. Stay Foolish. And I have always wished that for myself."
        self.demoLabel3.textColor = .white
        self.demoLabel3.font = .preferredFont(forTextStyle: .title1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:MarqueeLabelProtocol {
    func tap(sender: MarqueeLabel) {
        print(sender.text)
    }
}
