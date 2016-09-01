//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by AW on 31/08/2016.
//  Copyright © 2016 AW. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailField: CustomTextField!
    @IBOutlet weak var thumbImg: UIImageView!
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style:UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
       
        
        
        
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
               getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
        self.stores = try context.fetch(fetchRequest)
        self.storePicker.reloadAllComponents()
            
        } catch {
            
            //handle error
        }
        
     
        
        
        
    }
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        let picture = Image(context: context)
        picture.image = thumbImg.image
        
        
        if itemToEdit == nil {
            item = Item(context: context)
            
        } else {
            
            item = itemToEdit
        }
        
        if let title = titleField.text{
            item.title = title
            
        }
        
        item.toImage = picture
        
        if let price = priceField.text{
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailField.text{
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }


    func loadItemData() {
        
        if let item = itemToEdit{
            
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailField.text = item.details
            thumbImg.image = item.toImage?.image as? UIImage
            
            
            
            if let store = item.toStore{
                var index = 0
                
                repeat {
                let s = stores[index]
                    if s.name == store.name{
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                    
                } while (index < stores.count)
                
            }
        }
        
        
        
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
            
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    

    
    @IBAction func addImage(_ sender: UIButton) {
    
    present(imagePicker, animated: true, completion: nil)
    
    
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        thumbImg.image = image
        
        
        
        
        
    }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    
    
    
}

    func pickerSetup() {
        
        
        let store = Store(context: context)
        store.name = "Waitrose"
        
        let store2 = Store(context: context)
        store2.name = "John Lewis"
        
        let store3 = Store(context: context)
        store3.name = "Amazon"
        
        let store4 = Store(context: context)
        store4.name = "Sainsbury"
        
        let store5 = Store(context: context)
        store5.name = "M&S"
        
        let store6 = Store(context: context)
        store6.name = "Tesco"
        
        let store7 = Store(context: context)
        store7.name = "Other"
        
        ad.saveContext()

    }


}





