//
//  ItemCell.swift
//  DreamLister
//
//  Created by AW on 26/08/2016.
//  Copyright © 2016 AW. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    
    func configureCell(item: Item){
    
    title.text = item.title
        price.text = "£\(item.price)"
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage

        
}
}
