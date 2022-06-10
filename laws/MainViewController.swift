//
//  MainViewController.swift
//  laws
//
//  Created by 高橋蓮 on 2022/06/10.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    var list = ["憲法", "民法", "刑法", "商法", "刑事訴訟法", "民事訴訟法"]
    var giveUrl = ""
    var num = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "6aws"
        view.backgroundColor = UIColor(#colorLiteral(red: 0.2685144057, green: 0.4098663574, blue: 0.5113705851, alpha: 1))
        
        //tableviewスクロール禁止
        table.isScrollEnabled = false
        
        table.delegate = self
        table.dataSource = self
    }
}


//MARK: - Extensions

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    //セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.backgroundColor = UIColor(#colorLiteral(red: 0.2685144057, green: 0.4098663574, blue: 0.5113705851, alpha: 1))
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "PingFangHK-Light", size: 30)
        cell.textLabel!.textAlignment = NSTextAlignment.center
        return cell
    }
    //セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int(view.bounds.height) / list.count - 15)
    }
    
    //MARK: - didSelectRowAt & performSegue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Mainに戻ったら、Cellの選択状態を解除する
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        //webviewにurlの情報を渡す。
        switch indexPath.row {
        case 0://憲法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=321CONSTITUTION_19470503_000000000000000&keyword=%E6%86%B2%E6%B3%95"
        case 1://民法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=129AC0000000089_20220401_430AC0000000059&keyword=%E6%B0%91%E6%B3%95"
        case 2://刑法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=140AC0000000045_20200401_430AC0000000072&keyword=%E5%88%91%E6%B3%95"
        case 3://商法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=132AC0000000048_20200401_429AC0000000045&keyword=%E5%95%86%E6%B3%95"
        case 4://刑事訴訟法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=323AC0000000131_20220401_503AC0000000037&keyword=%E5%88%91%E4%BA%8B%E8%A8%B4%E8%A8%9F%E6%B3%95"
        case 5://民事訴訟法
            giveUrl = "https://elaws.e-gov.go.jp/document?lawid=408AC0000000109_20201001_502AC0000000022&keyword=%E6%B0%91%E4%BA%8B%E8%A8%B4%E8%A8%9F%E6%B3%95"
        default:
            break
        }
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let vc = segue.destination as! webViewController
            vc.reciveUrl = giveUrl
        }
    }
}

