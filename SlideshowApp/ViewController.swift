import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
        if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            susumu.isEnabled = true
            modoru.isEnabled = true
            // ボタンの名前を再生とする
            saisei.setTitle("再生", for: .normal)
            
        }
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    @IBAction func backButtonTap(_ sender: Any) {
        if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
            // 表示している画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    @IBAction func switchButtonTap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、
        //　タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                                              target: self, selector:
                #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            susumu.isEnabled = false
            modoru.isEnabled = false
            
            // ボタンの名前を停止とする
            saisei.setTitle("停止", for: .normal)
            
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            susumu.isEnabled = true
            modoru.isEnabled = true
            // ボタンの名前を再生とする
            saisei.setTitle("再生", for: .normal)
            
        }
    }
    
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        }
    }
    
    @IBOutlet weak var modoru: UIButton!
    
    @IBOutlet weak var saisei: UIButton!
    
    @IBOutlet weak var susumu: UIButton!
    
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["IMG_0327", "IMG_0960", "スクリーンショット 2020"]
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        picture.image = image
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "IMG_0327")
        picture.image = image
    }
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerのインスタンスを取得する
        let zoomInViewController:ResultViewController = segue.destination as! ResultViewController
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // 遷移先のZoomInViewControllerで宣言しているselectedImgに値を代入して渡す
        zoomInViewController.selectedImg = image
    }
    
}
