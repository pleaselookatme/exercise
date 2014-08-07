//
//  mainViewController.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//主视图在这个页面产生


import UIKit
class mainViewController:UIViewController{
    //游戏方格维度
    var dimension:Int = 4
    //过关最大值
    var maxnumber:Int = 2048
    //数字格子的宽度
    var width:CGFloat = 50
    //格子之间的间距
    var padding:CGFloat = 6
    //保存背景图数据
    var backgrounds: Array<UIView>//uiview数组格式
    
    //游戏数据模型
    var gmodel:GameModel
    //保存界面上数字lable数据
    var tiles:Dictionary<NSIndexPath,TileView>
    //保存数字实际值
    var tileVals:Dictionary<NSIndexPath,Int>
    init(){
        self.backgrounds =  Array<UIView>()
        self.tiles = Dictionary()
        var count = self.dimension*self.dimension
        self.gmodel = GameModel(dimension: self.dimension)//非常的好的想法，把self.dimension 成功传值到gamemodel里面。可以调用页面的init，nice！！
        self.tileVals  = Dictionary()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    override func viewDidLoad()
    { super.viewDidLoad()
        setupBackground()//设置背景
        setButtons()
        setupSwipeGuestures()
        for i in 0..<2{
            genNumber()//产生数字
        }
        
    }
    
    //设置新button
    func setButtons(){
        var cv = ControlView()
        var btnreset = cv.createButton("重置", action:Selector("resetTapped"), sender: self)
        btnreset.frame.origin.x = 30
        btnreset.frame.origin.y = 450
        self.view.addSubview(btnreset)
        var btngen = cv.createButton("新数", action:Selector("genTapped"), sender: self)
        btngen.frame.origin.x = 150
        btngen.frame.origin.y = 450
        self.view.addSubview(btngen)
    }
    
    
    
    //给出button对应的事件
    func resetTapped(){
        println("reset!!!")
        resetUI()
        gmodel.initTiles()//初始化
    }
    
    
    func initUI(){
        for i in 0..<dimension{
            for j in 0..<dimension {
                var index = i*self.dimension + j
                if gmodel.tiles[index] != 0 {
                    insertTitle((i,j), value: gmodel.tiles[index])
                }
            }
        }
    }
    
    
    
    func resetUI(){
        for (key,tile) in tiles {
            tile.removeFromSuperview()
        }
        tiles.removeAll(keepCapacity: true)
        tileVals.removeAll(keepCapacity: true)
    }
    
    
    
    
    
    func genTapped(){
        println("new number!")
        genNumber()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //设置背景，一列一列的产生方格，padding间距
    func setupBackground(){
        var x:CGFloat = 30
        var y:CGFloat = 150
        for i in 0..<dimension {
            y =  150
            for j in 0..<dimension {
                var background = UIView(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                backgrounds += background//把背景图保存在backgrounds
                y += padding + width
            }
            x += padding + width
        }
    }
    //除去一个标签的值
    func removeKeyTile(key:NSIndexPath){
        var tile = tiles[key]!
        var tileVal = tileVals[key]
        tile.removeFromSuperview()
        tiles.removeValueForKey(key)
        tileVals.removeValueForKey(key)
    }
    //方向
    //手势效果,上下左右
    func setupSwipeGuestures(){
        let upSwipe = UISwipeGestureRecognizer(target: self, action:Selector("swipeUp"))
        upSwipe.numberOfTouchesRequired = 1
        upSwipe.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(upSwipe)
        let downSwipe = UISwipeGestureRecognizer(target: self, action:Selector("swipeDown"))
        downSwipe.numberOfTouchesRequired = 1
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipe)
        let leftSwipe = UISwipeGestureRecognizer(target: self, action:Selector("swipeLeft"))
        leftSwipe.numberOfTouchesRequired = 1
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:Selector("swipeRight"))
        rightSwipe.numberOfTouchesRequired = 1
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    //把tiles输出出来
    func printTiles(tiles:Array<Int>){
        var count = tiles.count
        for var i=0; i<count; i++ {
            if (i+1) % Int(dimension) == 0 {      //4*4输出值
                println(tiles[i])
            } else{
                print("\(tiles[i])\t")
            }
        }
        println("")
    }
    //当进行向上手势时进行的事件
    func swipeUp(){
        println("swipeUp")
        gmodel.reflowUp()
        gmodel.mergeUp()
        gmodel.reflowUp()
        printTiles(gmodel.tiles)
        printTiles(gmodel.mtiles)
        resetUI()
        initUI()
        genNumber()
        
        /*for i in 0...dimension{
        for j in 0...dimension {
        var row:Int = i
        var col:Int = j
        var key = NSIndexPath(forRow: row, inSection: col)
        if tileVals.indexForKey(key) != nil{
        //如果行大雨3行，上移1行
        if row>0 { //行是从上乡下数的
        var value = tileVals[key]
        removeKeyTile(key)
        var index = row*dimension + col - dimension//这三行主要是使得行变列不变。大于0行就是从上往下第二行开始可以跳动
        row = Int(index/dimension) //向上跳了一行
        col = index - row * dimension //
        insertTitle((row,col), value: value!)
        }
        }
        }
        }*/
    }
    func swipeDown(){
        println("swipeDown")
        
        gmodel.reflowDown()
        gmodel.mergeDown()
        gmodel.reflowDown()
        printTiles(gmodel.tiles)
        printTiles(gmodel.mtiles)
        resetUI()
        initUI()
        genNumber()
    }
    func swipeLeft(){
        println("swipeLeft")
        gmodel.reflowLeft()
        gmodel.mergeLeft()
         gmodel.reflowLeft()
        printTiles(gmodel.tiles)
        printTiles(gmodel.mtiles)
        resetUI()
        initUI()
        genNumber()
    }
    func swipeRight(){
        println("swipeRight")
        gmodel.reflowRight()
        gmodel.mergeRight()
        gmodel.reflowRight()
        printTiles(gmodel.tiles)
        printTiles(gmodel.mtiles)
        resetUI()
        initUI()
        genNumber()
    }
    
    
    
    
    
    //获取数字
    func genNumber(){
        // var seedNumber = [2,4]
        let randv = Int(arc4random_uniform(10))//10%的概率，10以内的随机数
        
        println(randv)
        var seed:Int = 2
        if  randv == 1 {
            seed = 4
        }
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        
        if (gmodel.isFull()){
            println("位置满了")
            return
        }
        if (gmodel.setPosition(row ,col:col , value:seed)==false){
            genNumber()
            return
        }
        insertTitle((row,col), value: seed)
    }
    //加入数字
    func insertTitle(pos:(Int,Int),value:Int){
        let (row,col) = pos;
        let x = 30 + CGFloat(col)*(width+padding)
        let y = 150 + CGFloat(row)*(width+padding)
        let tile = TileView(pos: CGPoint(x: x,y: y), width: width, value: value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
        var index = NSIndexPath(forRow: row, inSection: col)
        tiles[index] = tile
        tileVals[index] = value
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))//动画展示
        //动画显示以0.3，延迟0.1秒数字出现，以后可以调用着玩
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions(), animations: {
            () -> Void in
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(1, 1))
            },
            completion: {
                (finished:Bool) -> Void in
                UIView.animateWithDuration(0.08,animations:{
                    ()-> Void in
                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
    }
}


















