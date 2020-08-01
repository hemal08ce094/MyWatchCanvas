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
        let titles = ["①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩"]
        let captions = ["① is one", "② is two", "③ is three", "④ is four", "⑤ is five"]
        
        for i in 0...9 {
            let item = WKPickerItem()
            item.title = titles[i]
            let string = "item_type_\(i + 1)"
            item.accessoryImage = WKImage(imageName: string)
            item.contentImage = WKImage(imageName: string)
            its.append(item)
        }
        return its
    }()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        colorPicker.setItems(itemArray)
        
        colorPicker.focus()
    }
    
    @IBAction func pickerSelected(_ value: Int) {
        print(itemArray[value].title!)
    }
}
