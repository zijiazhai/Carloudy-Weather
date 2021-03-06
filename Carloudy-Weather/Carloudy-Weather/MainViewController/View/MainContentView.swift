//
//  MainContentCollectionView.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/14/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit
import CarloudyiOS

//fileprivate let cellId = "cellId"
//fileprivate let headerCellId = "headerCellId"



class MainContentView: UIView {
    fileprivate var titles: [String]
    let carloudyBLE = CarloudyBLE.shareInstance
    lazy var mainContentViewHeader: MainContentViewHeader = {
        let header = MainContentViewHeader(frame: CGRect(x: 0, y: 0, width: zjScreenWidth, height: 200))
        header.delegate = self
        return header
    }()
    
    
    lazy var collectionView : MainCollectionView = {
        let cv = MainCollectionView(frame: CGRect(x: 0, y: 200, width: zjScreenWidth, height: 100))
//        cv.backgroundColor = .yellow
        return cv
    }()
    
//    fileprivate lazy var topHeaderView : MainContentViewCellHeader = {
//        let headerView = MainContentViewCellHeader()
//        headerView.frame = CGRect(x: 0, y: 0, width: zjScreenWidth, height: 200)
//
//        return headerView
//    }()
    
    let tableView: MainContentTableView = {
        let tv = MainContentTableView(frame: CGRect(x: 0, y: 320, width: zjScreenWidth, height: zjScreenHeight - 300))
        tv.backgroundColor = .clear
//        tv.backgroundColor = .red
        return tv
    }()
    
    fileprivate lazy var collectionViewCell : MainContentViewCell = {
        let headerView = MainContentViewCell()
        return headerView
    }()
    
    

    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        backgroundColor = .gray
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
//        addSubview(timeLabel)
//        timeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
//        collectionView.addSubview(topHeaderView)
//        topHeaderView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        addSubview(mainContentViewHeader)
        
        addSubview(collectionView)
//        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(tableView)
//        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 310, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}
extension MainContentView: MainContentViewHeaderDelegate{
    func mainContentViewHeader(temperature: String, weather: String, icon: String) {
        let carloudyBLE = CarloudyBLE.shareInstance
        if let pairkey = carloudyBlePairKey_{
            carloudyBLE.newKeySendToPairAndorid_ = pairkey
        }
        carloudyBLE.startANewSession(appId: carloudyAppStoreAppKey_)
        carloudyBLE.createIDAndViewForCarloudyHud(textViewId: "1", labelTextSize: 30, postionX: 20, postionY: 10, width: 00, height: 00)
        carloudyBLE.createIDAndViewForCarloudyHud(textViewId: "2", labelTextSize: 30, postionX: 20, postionY: 30, width: 00, height: 00)
        carloudyBLE.createIDAndViewForCarloudyHud(textViewId: "3", labelTextSize: 30, postionX: 20, postionY: 50, width: 00, height: 00)
        let degree = temperature.dropLast() + "  degree"
        carloudyBLE.sendMessage(textViewId: "1", message: String(degree) )
        carloudyBLE.sendMessage(textViewId: "2", message: "Weather: \(weather)" )
        carloudyBLE.sendMessage(textViewId: "3", message: "City: \(currentCity_!)" )
//        carloudyBLE.sendMessage(textViewId: "1", message: temperature + weather + (currentCity_ ?? ""))
//        carloudyBLE.sendMessage(textViewId: "1", message: weather + currentCity_! + degree )
//        carloudyBLE.createPictureIDAndImageViewForCarloudyHUD(picID: "ad", postionX: 20, postionY: 20, width: 50, height: 50)
        
    }
    
    
    
}
