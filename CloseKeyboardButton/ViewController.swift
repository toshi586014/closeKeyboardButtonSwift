//
//  ViewController.swift
//  CloseKeyboardButton
//
//  Created by 3BR-T on 2015/09/09.
//  Copyright (c) 2015年 3BR-T. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.inputTextField.delegate = self
        
        // キーボードに閉じるボタンを追加する
        self.makeCloseButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeCloseButton(){
        // 閉じるボタンを配置するUIViewを作成する
        let buttonView: UIView = UIView()
        // ビューの大きさは、画面の横幅と同じで高さは44にする
        let viewWidth: CGFloat = self.view.bounds.size.width
        let viewHeight: CGFloat = 44
        let viewRect: CGRect = CGRectMake(0, 0, viewWidth, viewHeight)
        buttonView.frame = viewRect
        // ビューの背景色を設定する
        buttonView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        // 閉じるボタンを作成する
        let closeButton: UIButton = UIButton(type: UIButtonType.System)
        // ボタンの大きさは、横幅が60で高さは30にする
        let buttonWidth: CGFloat = 60
        let buttonHeight: CGFloat = 30
        let buttonRect: CGRect = CGRectMake(0, 0, buttonWidth, buttonHeight)
        closeButton.bounds = buttonRect
        // ボタンのx座標は画面の右端からマージンを引いた位置、y座標はボタンビューの真ん中にする
        let buttonMargin: CGFloat = 10
        let buttonCenterX = self.view.bounds.size.width - buttonMargin - buttonWidth / 2
        let buttonCenterY = buttonView.bounds.size.height / 2
        let buttonCenter = CGPointMake(buttonCenterX, buttonCenterY)
        closeButton.center = buttonCenter
        // ボタンのタイトルを『Close』にする
        closeButton.setTitle("Close", forState: UIControlState.Normal)
        
        // 閉じるボタンを押したときに呼ばれる動作を設定する
        closeButton.addTarget(self, action: "closeKeyboard", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 閉じるボタンをViewに追加する
        buttonView.addSubview(closeButton)
        
        // 閉じるボタンつきのViewをUITextFieldのinputAccessoryViewに設定する
        self.inputTextField.inputAccessoryView = buttonView
    }
    
    // キーボードを閉じる
    func closeKeyboard(){
        self.inputTextField.resignFirstResponder()
    }
    
    // リターンキーを押したときにキーボードを閉じる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

