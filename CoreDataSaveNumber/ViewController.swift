//
//  ViewController.swift
//  CoreDataSaveNumber
//
//  Created by NgocAnh on 5/16/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imputView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func display() {
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
                imputView.text = String(entity.last?.number ?? 0)
        }
        catch{
            print("No Data")
        }
    }

    @IBAction func showButton(_ sender: UIButton) {
        let entity = Entity(context: AppDelegate.context)
        entity.number = Int32(Int(imputView.text ?? "") ?? 0 )
        AppDelegate.saveContext()
    }
    
}

