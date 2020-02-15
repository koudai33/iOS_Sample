//
//  ViewController.swift
//  maguro
//
//  Created by koudai on 2019/12/01.
//  Copyright © 2019 Koudai Yamao. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
     //カメラで撮影してし取得する。カメラが起動する
    let camera = UIImagePickerController.SourceType.camera
    
   
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        
        if UIImagePickerController.isSourceTypeAvailable(camera) {
               let picker = UIImagePickerController()
               picker.sourceType = camera
                picker.delegate = self
                self.present( picker ,animated:true)
           }
           
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didfinishpickermediawithinfo info: [UIImagePickerController.InfoKey:Any]) {
        
        //辞書infoからオリジナルの画像を取り出す
        let image = info [UIImagePickerController.InfoKey.originalImage]as! UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil,  nil,  nil)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

