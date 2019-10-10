//
//  TodayViewController.swift
//  TodaySwiftExt
//
//  Created by Javier on 10/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import NotificationCenter

/*class myView: UIView {
  func prepare() {
      backgroundColor = UIColor.blueColor()
  }

  override func drawRect(rect: CGRect) {
  // custom stuff
  }
}*/

class MyView: MacawView {

  required init?(coder aDecoder: NSCoder) {
    let text = Text(text: "Hello, World!", place: .move(dx: 0, dy: 0))
    super.init(node: text, coder: aDecoder)
  }

}

class TodayViewController: UIViewController, NCWidgetProviding {
  
 override func loadView()
  {
    let viewPlaying = TotalOfStepsView()
      view = viewPlaying
    viewPlaying.play()
    self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
  }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
