//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 森本記庸 on 2021/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!

    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // タイマーをセット
    var timer: Timer!
    
    // 画像の配列を宣言
    var imageArray:[UIImage] = [UIImage(named: "cat1.JPG")!,UIImage(named:"cat2.JPG")!,UIImage(named:"cat3.JPG")!]
    
    // 画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController: ResultViewController
             = segue.destination as! ResultViewController
        
        //再生か停止かを判定
        if (timer != nil){
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除
            timer = nil
            // ボタンの名前を再生に変更
            playStopButton.setTitle("再生", for: .normal)
            
            // 進むと戻るボタンを有効
            moveButton.isEnabled = true
            backButton.isEnabled = true
            
        }

        resultViewController.image = imageArray[nowIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveButton(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if(nowIndex == imageArray.count){
            //indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセット
        mainView.image = imageArray[nowIndex]
    }
    
    @IBAction func backButton(_ sender: Any) {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1
        
        // indexが表示予定の画像の数と同じ場合
        if(nowIndex < 0){
            // indexを一番最初の数字に戻す
            nowIndex = imageArray.count - 1
        }
        // indexの画像をstoryboardの画像にセット
        mainView.image = imageArray[nowIndex]
    }
    
    // 再生と停止を押した場合の処理
    @IBAction func playStopButton(_ sender: Any) {
        // 進むと戻るボタンを無効
        moveButton.isEnabled = false
        backButton.isEnabled = false
        
        //再生か停止かを判定
        if (timer == nil){
            // タイマーをセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoMove), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変更
            playStopButton.setTitle("停止", for: .normal)
            
        } else {
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除
            timer = nil
            
            // ボタンの名前を再生に変更
            playStopButton.setTitle("再生", for: .normal)
            
            // 進むと戻るボタンを有効
            moveButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @objc func autoMove(){
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if(nowIndex == imageArray.count){
            //indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセット
        mainView.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

