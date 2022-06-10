
import Foundation
import UIKit
import WebKit

class webViewController: UIViewController {
    
    var reciveUrl: String = ""

    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webview = WKWebView(frame: .zero,
                                configuration: configuration)
        return webview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        guard let url = URL(string: reciveUrl) else {return}
        webView.load(URLRequest(url: url))
        //customUserAgentで表示させるwebviewのサイズを決定する
        webView.customUserAgent = "iPhone/Chrome"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
