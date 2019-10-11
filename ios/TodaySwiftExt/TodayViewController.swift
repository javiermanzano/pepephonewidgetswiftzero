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

let file = "readit"
let text = "<g id=\"usage/progress/icon/data\" transform=\"translate(17.000000, 18.000000)\">" +
"   <g id=\"ic_data-consume\">" +
"      <path d=\"M16,17.01 L16,10 L14,10 L14,17.01 L11,17.01 L15,21 L19,17.01 L16,17.01 L16,17.01 Z M9,3 L5,6.99 L8,6.99 L8,14 L10,14 L10,6.99 L13,6.99 L9,3 Z\" id=\"Shape\" fill=\"#737373\" fill-rule=\"nonzero\"></path>" +
"      <polygon id=\"Shape\" points=\"0 0 24 0 24 24 0 24\"></polygon>" +
"   </g>" +
"</g>";

func writeToFile() {
  if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let fileURL = dir.appendingPathComponent(file)
      do {
          try text.write(to: fileURL, atomically: false, encoding: .utf8)
      }
      catch {/* error handling here */}
      do {
          let text2 = try String(contentsOf: fileURL, encoding: .utf8)
          NSLog("-->> %@", text2)
      }
      catch {/* error handling here */}
  }
}

class TodayViewController: UIViewController, NCWidgetProviding {
  
    override func loadView() {
      let customView = MyView()
      view = customView
      customView.play()
      view.backgroundColor = UIColor.white
      self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
      writeToFile()
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
