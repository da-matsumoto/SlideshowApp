//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松本大佑 on 2017/06/26.
//  Copyright © 2017年 daisuke.matsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var backGround: UIImageView!
  @IBOutlet weak var mainPhoto: UIImageView!
  
  
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  
  //タップジェスチャ
  @IBAction func onTapImage(_ sender: Any) {
    //セグエを利用して画面を遷移
    self.performSegue(withIdentifier: "result", sender: self.photonumber)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let resultViewController:resultViewController = segue.destination as! resultViewController
    
    resultViewController.photonumber = self.photonumber
    
  }
  
  
  //メイン画像
  let photos = ["summer_01.png","summer_02.png","summer_03.png"]
  //背景画像
  let backgrounds = ["bg_01.png","bg_02.png","bg_03.png"]
  
  //タイマー用変数
  var timer: Timer!
  var timer_sec: Float = 0
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //メイン画像
    mainPhoto.image = UIImage(named:"summer_01.png")
    
    //背景画像
    backGround.image = UIImage(named:"bg_01.png")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //進むボタン
  var photonumber = 0
  @IBAction func next(_ sender: Any) {
    photonumber += 1
    
    if photonumber > 2{
      photonumber = 0
    }
    mainPhoto.image = UIImage(named:photos[photonumber])
    backGround.image = UIImage(named:backgrounds[photonumber])
    
    
  }
  
  //戻るボタン
  @IBAction func back(_ sender: Any) {
    if photonumber == 0 {
      photonumber = 2
    } else{
      photonumber -= 1
    }
    mainPhoto.image = UIImage(named:photos[photonumber])
    backGround.image = UIImage(named:backgrounds[photonumber])
  }
  
  //タイマー関数
  func updateTimer(timer: Timer){
    self.timer_sec += 2
    photonumber += 1
    
    if photonumber > 2{
      photonumber = 0
    }
    mainPhoto.image = UIImage(named:photos[photonumber])
    backGround.image = UIImage(named:backgrounds[photonumber])
  }
  
  //再生・停止ボタン
  @IBAction func goAndStop(_ sender: Any) {
    if self.timer == nil{
      self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      nextButton.isEnabled = false
      backButton.isEnabled = false
    } else{
      self.timer.invalidate()
      self.timer = nil
      nextButton.isEnabled = true
      backButton.isEnabled = true
    }
  }
  
  @IBAction func unwind(_ segue:UIStoryboardSegue){}
  


}

