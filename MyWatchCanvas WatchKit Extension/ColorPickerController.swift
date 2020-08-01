//
//  ColorChangePickerController.swift
//  MyWatchCanvas WatchKit Extension
//
//  Created by Hemal on 01/08/2020.
//  Copyright © 2020 Hemal. All rights reserved.
//

import Foundation
import WatchKit

class ColorPickerController: WKInterfaceController {
    
    @IBOutlet weak var colorPicker: WKInterfacePicker!
    
    lazy var itemArray: [WKPickerItem] = {
        var its = [WKPickerItem]()
        let titles = ["darkGray", "lightGray", "white", "gray", "red", "green", "blue", "cyan", "yellow", "magenta", "orange", "purple", "brown"]
        
        for i in 0...12 {
            let item = WKPickerItem()
//            item.title = titles[i]
            let string = "item_type_\(i + 1)"
            item.contentImage = WKImage(image: stringToImage(titles[i], color: ColorManager.defaultManager.availableColors[i]) ?? UIImage())
            its.append(item)
        }
        return its
    }()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        colorPicker.setItems(itemArray)
//        colorPicker.setim
        colorPicker.focus()
    }
    
    @IBAction func pickerSelected(_ value: Int) {
//        print(itemArray[value].title!)
        
        let userDefaults = UserDefaults.standard
         userDefaults.set(value, forKey: KEY_SELF_Color)
         userDefaults.synchronize()
    }
    
    // MARK: Helper Functions
    private func stringToImage(_ str: String, color: UIColor) -> UIImage? {
      let imageSize = CGSize(width: 120, height: 20)
      UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
      UIColor.clear.set()
      let rect = CGRect(origin: CGPoint.zero, size: imageSize)
      UIRectFill(rect)
     
      let style = NSMutableParagraphStyle()
      style.alignment = .center
      (str as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                                                        NSAttributedString.Key.paragraphStyle: style,
                                                        NSAttributedString.Key.foregroundColor: color,
                                                        NSAttributedString.Key.baselineOffset: -3.0])
      
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return image
    }
}
