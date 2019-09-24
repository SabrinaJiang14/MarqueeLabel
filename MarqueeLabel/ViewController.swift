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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.demoLabel.innerText = "Last year's bleaching event, the worst on record, mainly affected the north of the reef..."
        self.demoLabel.innerSize = 15
        self.demoLabel.innerColor = UIColor.blue
        self.demoLabel.isShowOpacity = false
        self.demoLabel.isShowAllText = true
        
        self.demoLabel2.innerText = "Searching for the lost continent of Mauritia"
        self.demoLabel2.innerSize = 10
        self.demoLabel2.innerColor = UIColor.green
        self.demoLabel2.isShowAllText = false
        
        self.demoLabel3.innerText = "Last year's bleaching event, the worst on record, mainly affected the north of the reef..."
        self.demoLabel3.innerSize = 15
        self.demoLabel3.innerColor = UIColor.gray
        self.demoLabel3.isShowAllText = false
        self.demoLabel.isShowOpacity = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

