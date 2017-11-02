//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func viewDidLoad() {
        super.loadView()
        self.title = "hello"
        self.view.backgroundColor = .white
        let label = UILabel()
        label.frame = CGRect(x: 130, y: 100, width: 100, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        self.view.addSubview(label)
        
        let imageView = UIImageView(frame: CGRect(x: 150, y: 150, width: 60, height: 60))
        imageView.image = UIImage(named: "拍照")
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 150, y: 250, width: 60, height: 44))
        let actionA = #selector(click as () -> ())
        button.addTarget(self, action: actionA, for: .touchUpInside)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .cyan
        self.view.addSubview(button)
    }
    @objc func click() {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
}
class TableViewDataSource: NSObject, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let style = UITableViewCellStyle(rawValue: row % 4)
        let cell = UITableViewCell(style: style!, reuseIdentifier: nil)
        cell.textLabel?.text = "Text"
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Detail Text"
            print(detailTextLabel.text as AnyObject)
        }
        return cell
    }
}
class SecondViewController: UIViewController, UITableViewDataSource {
    override func viewDidLoad() {
        super.loadView()
        self.title = "Second view controller"
        let dataSource = TableViewDataSource()
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 667), style: .plain)
        tableView.dataSource = dataSource
        self.view.addSubview(tableView)
    }
    // MARK - UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let style = UITableViewCellStyle(rawValue: row % 4)
        let cell = UITableViewCell(style: style!, reuseIdentifier: nil)
        cell.textLabel?.text = "Text"
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Detail Text"
        }
        return cell
    }
}
// Present the view controller in the Live View window
let naviController = UINavigationController(rootViewController: MyViewController())
PlaygroundPage.current.liveView = naviController
