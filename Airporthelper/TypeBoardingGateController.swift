//
//  TypeBoardingGateController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//输入登机口界面
class TypeBoardingGateController: UIViewController, UITextFieldDelegate {
    
    //输入栏
    @IBOutlet weak var TypeBoardingGate: UITextField!
    //提示标签
    @IBOutlet weak var alertLabel: UILabel!
    //一键登机提示标签
    @IBOutlet weak var alertLabelOneTap: UILabel!
    @IBOutlet weak var TypeBoardingGateOneTap: UITextField!
    
    @IBAction func cancelOneTap(sender: UIButton) {     //一键登机版
        
        if !destinations.isEmpty {      //如果目的地数组非空
            destinations.removeLast()   //移除最后一项
        }
        inOneTap = false
    }
    
    @IBAction func cancel(sender: UIButton) {
        //若数组非空，则删除最后一个元素
        if !destinations.isEmpty {
            destinations.removeLast()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if TypeBoardingGate != nil {
            TypeBoardingGate.delegate = self
        } else {
            TypeBoardingGateOneTap.delegate = self
            //self.enterButtonOneTap.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //返回
    @IBAction func backToTypeBoardingGateController(segue : UIStoryboardSegue) {
        
    }

    //从输入栏读取并绘画路径
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        ifCheckBoardWrong = false
        destinations.removeAll(keepCapacity: false)
        switch TypeBoardingGate.text! {
        case "E1":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE1, atIndex: destinations.count)
            }
            
        case "E2":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE2, atIndex: destinations.count)
            }
            
        case "E3":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE3, atIndex: destinations.count)
            }
            
        case "E4":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE4, atIndex: destinations.count)
            }
            
        case "E5":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE5, atIndex: destinations.count)
            }
        
        case "E6":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC1, atIndex: destinations.count)
            } else {
                destinations.insert(SE6, atIndex: destinations.count)
            }
            
        case "E7":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE7, atIndex: destinations.count)
            }
            
        case "E8":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE8, atIndex: destinations.count)
            }
            
        case "E9":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE9, atIndex: destinations.count)
            }
            
        case "E10":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE10, atIndex: destinations.count)
            }
            
        case "E11":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE11, atIndex: destinations.count)
            }

        case "E12":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC2, atIndex: destinations.count)
            } else {
                destinations.insert(SE12, atIndex: destinations.count)
            }
            
        case "E13":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE13, atIndex: destinations.count)
            }
            
        case "E14":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE14, atIndex: destinations.count)
            }
            
        case "E15":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE15, atIndex: destinations.count)
            }
            
        case "E16":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE16, atIndex: destinations.count)
            }
            
        case "E17":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE17, atIndex: destinations.count)
            }
            
        case "E18":
            ifCheckBoardWrong = false
            if inOneTap {
                alertLabelOneTap.text = " "
            } else {
                alertLabel.text = " "
            }
            if goToSafety {
                destinations.insert(SSC3, atIndex: destinations.count)
            } else {
                destinations.insert(SE18, atIndex: destinations.count)
            }
            
        default:
            if inOneTap {
                alertLabelOneTap.text = "输错啦！"
            } else {
                alertLabel.text = "输错啦！"
            }
            
            ifCheckBoardWrong = true
        }

        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GotBoardingGate" {

            if TypeBoardingGate.text != "" && !ifCheckBoardWrong {
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()        //生成路径
            } else {
                let alertView = UIAlertView()
                alertView.delegate = self
                alertView.title = "⚠️"
                alertView.message = "您输入的登机口不存在"
                alertView.addButtonWithTitle("知道了")
                alertView.show()
            }

        } else if segue.identifier == "GotBoardingGateOneTap" {
            
            if TypeBoardingGateOneTap.text != "" && !ifCheckBoardWrong {
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()        //生成路径
            } else {
                let alertView = UIAlertView()
                alertView.delegate = self
                alertView.title = "⚠️"
                alertView.message = "您输入的登机口不存在"
                alertView.addButtonWithTitle("知道了")
                alertView.show()
            }
            
            let getdata = GetDataFromDataModel()
            getdata.totalRouteMake()        //生成路径
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        TypeBoardingGate.resignFirstResponder()
    }
}
