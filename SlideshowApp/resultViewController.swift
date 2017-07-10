//
//  resultViewController.swift
//  SlideshowApp
//
//  Created by 松本大佑 on 2017/07/10.
//  Copyright © 2017年 daisuke.matsumoto. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
  
  //メイン画像
  @IBOutlet weak var mainResultImage: UIImageView!
  //背景画像
  @IBOutlet weak var backResultImage: UIImageView!
  
  //メイン画像
  let photos = ["summer_01.png","summer_02.png","summer_03.png"]
  //背景画像
  let backgrounds = ["bg_01.png","bg_02.png","bg_03.png"]
  
  var photonumber = 0
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      mainResultImage.image = UIImage(named:photos[photonumber])
      backResultImage.image = UIImage(named:backgrounds[photonumber])
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
