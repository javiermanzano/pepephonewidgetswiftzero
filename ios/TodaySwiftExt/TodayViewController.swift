//
//  TodayViewController.swift
//  TodaySwiftExt
//
//  Created by Javier on 10/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import NotificationCenter

class MyView: MacawView {

  open func play() {
    /*let text = Text(text: "Hello, World!", place: .move(dx: 0, dy: 0))
    super.init(node: text, coder: aDecoder)*/
    do {
      self.node = try SVGParser.parse(path: "camera")
    } catch {
      let text = Text(text: "Hello, World!", place: .move(dx: 0, dy: 0))
      self.node = text
    }
  }

}

class TodayViewController: UIViewController, NCWidgetProviding {
  
    override func loadView() {
      let customView = MyView()
      view = customView
      customView.play()
      view.backgroundColor = UIColor.white
      self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
    if activeDisplayMode == .expanded {
        preferredContentSize = CGSize(width: 0, height: 380)
    } else {
        preferredContentSize = maxSize
    }
  }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
