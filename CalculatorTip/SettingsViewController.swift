import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var pctLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var okButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        var defaults = NSUserDefaults.standardUserDefaults()
        let doubleValue = Float(defaults.doubleForKey("default_tip_pct"))
        tipSlider.value = (doubleValue != 0) ? doubleValue : 18.0
        pctLabel.text = "\(Int(doubleValue))%"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okTapped(sender : AnyObject) {
        dismissViewControllerAnimated(true,
            completion: nil)
    }

    @IBAction func taxPercentageChanged(sender : AnyObject) {
        let tipPct = Int(tipSlider.value)
        pctLabel.text = "\(tipPct)%"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(Double(tipPct), forKey: "default_tip_pct")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
