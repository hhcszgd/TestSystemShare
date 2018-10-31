//
//  ViewController.swift
//  TestSystemShare
//
//  Created by WY on 2018/10/31.
//  Copyright © 2018 WY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}

extension ViewController{
    class DDActivity : UIActivity{
        override var activityType: UIActivity.ActivityType?{
            return UIActivity.ActivityType.postToTencentWeibo
        }
        
        override class  var activityCategory: UIActivity.Category { return .share }
        override var activityTitle: String? { return "wwxixi" } // default returns nil. subclass must override and must return non-nil value
        
        override  var activityImage: UIImage? {return  UIImage(named: "authentication") } // default returns nil. subclass must override and must return non-nil value
        
        
        // default returns nil. subclass may override to return custom activity type that is reported to completion handler
        // default returns nil. subclass must override and must return non-nil value
        // default returns nil. subclass must override and must return non-nil value
        
        override  func canPerform(withActivityItems activityItems: [Any]) -> Bool {return true }// override this to return availability of activity based on items. default returns NO
        
        override  func prepare(withActivityItems activityItems: [Any]) // override to extract items and set up your HI. default does nothing
        {
            
//            let req : SendMessageToWXReq = SendMessageToWXReq()
//            req.text = "xxxx"
//            req.bText = true
//            //        WXSceneSession  = 0,        /**< 聊天界面    */
//            //        WXSceneTimeline = 1,        /**< 朋友圈      */
//            //        WXSceneFavorite = 2,        /**< 收藏       */
//            req.scene = 0
//            WXApi.send(req)
        }
        
        
        //        override  var activityViewController: UIViewController? { get } // return non-nil to have view controller presented modally. call activityDidFinish at end. default returns nil
        
        
        // return non-nil to have view controller presented modally. call activityDidFinish at end. default returns nil
        
        override  func perform(){self.activityDidFinish(true )} // if no view controller, this method is called. call activityDidFinish when done. default calls [self activityDidFinish:NO]
        
        
        
    }
    
    
    func performShareWith() {
        
        // 要分享的图片
        let image = UIImage.init(named: "check")!
        // 要分享的文字
        let str = "分享"
        let url : URL =  URL(string : "http://www.bjyltf.com") ?? URL(string : "http://www.bjyltf.com")!
        // 将要分享的元素放到一个数组中
        let postItems = [ image, str , url] as [Any]
        let activity = DDActivity()
        //        activity.
        var a  = UIActivityViewController(activityItems: postItems, applicationActivities: [activity])
        a.excludedActivityTypes = [UIActivity.ActivityType.addToReadingList,.openInIBooks,.airDrop,.postToVimeo,.postToFlickr,.addToReadingList,.saveToCameraRoll,.assignToContact,.copyToPasteboard,.mail,.message,.postToWeibo,.postToTwitter,.postToFacebook]
        a.completionWithItemsHandler = { a , b , c , d in
            
        }
        self.present(a, animated: true , completion: nil)
        
        
        
        
        
        
        //        let activityVC = UIActivityViewController.init(activityItems: postItems, applicationActivities: nil)
        // 在展现 activityVC 时，必须根据当前的设备类型，使用适当的方法。在iPad上，必须通过popover来展现view controller。在iPhone和iPodtouch上，必须以模态的方式展现。
        //        if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        //            UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityVC];
        //            [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        //        } else {
        //        self.present(activityVC, animated: true , completion: nil)
        //        }
        
    }
}
