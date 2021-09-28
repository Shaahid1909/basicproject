

import UIKit
import NVActivityIndicatorView
import FlagPhoneNumber



extension ViewController: FPNTextFieldDelegate {
    func fpnDisplayCountryList() {
        print("list")
        let listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
        listController.setup(repository: usernameField.countryRepository)
        listController.didSelect = { [weak self] country in
            self?.usernameField.setFlag(countryCode: country.code)
        }
        let navigationViewController = UINavigationController(rootViewController: listController)
        listController.title = "Countries"
//        navigationViewController.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(listController, animated: true)
        self.present(navigationViewController, animated: true, completion: nil)
    }
    
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
          
        }else {
            // Do something...
        }
    }
}

class ViewController: UITableViewController {

    var loadingView : LoadingView!
    
    
    @IBOutlet weak var usernameField: FPNTextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        logbtn.layer.cornerRadius = 12
        usernameField.addBottomBorder()
        passwordField.addBottomBorder()
        
    }

    @IBAction func signupbtntapped(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpTableView") as? signuptvcontroller
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    @IBAction func loginbuttontapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "loginselect", sender: self)
        if let loaderView = loadingView{ // If loadingView already exists
                 if loaderView.isHidden() {
                     loaderView.show()  // To show activity indicator
                 }
             }
             else{
                 loadingView = LoadingView(uiView: view, message: "loading...")
              }
         }

}

extension UITextField {
  func addBottomBorder(){
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
    bottomLine.backgroundColor = UIColor.lightGray.cgColor//UIColor.white.cgColor
    borderStyle = .none
    layer.addSublayer(bottomLine)
  }
}


class LoadingView {

    let uiView          :   UIView
    let message         :   String
    let messageLabel    =   UILabel()

    let loadingSV       =   UIStackView()
    let loadingView     =   UIView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    init(uiView: UIView, message: String) {
        self.uiView     =   uiView
        self.message    =   message
        self.setup()
    }

    func setup(){
        let viewWidth   = uiView.bounds.width
        let viewHeight  = uiView.bounds.height

        // Configuring the message label
        messageLabel.text             = message
        messageLabel.textColor        = UIColor.darkGray
        messageLabel.textAlignment    = .center
        messageLabel.numberOfLines    = 3
        messageLabel.lineBreakMode    = .byWordWrapping

        // Creating stackView to center and align Label and Activity Indicator
        loadingSV.axis          = .vertical
        loadingSV.distribution  = .equalSpacing
        loadingSV.alignment     = .center
        loadingSV.addArrangedSubview(activityIndicator)
        loadingSV.addArrangedSubview(messageLabel)

        // Creating loadingView, this acts as a background for label and activityIndicator
        loadingView.frame           = uiView.frame
        loadingView.center          = uiView.center
        loadingView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        loadingView.clipsToBounds   = true

        // Disabling auto constraints
        loadingSV.translatesAutoresizingMaskIntoConstraints = false

        // Adding subviews
        loadingView.addSubview(loadingSV)
        uiView.addSubview(loadingView)
        activityIndicator.startAnimating()

        // Views dictionary
        let views = [
            "loadingSV": loadingSV
        ]

        // Constraints for loadingSV
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[loadingSV(300)]-|", options: [], metrics: nil, views: views))
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(viewHeight / 3)-[loadingSV(50)]-|", options: [], metrics: nil, views: views))
    }

    // Call this method to hide loadingView
    func show() {
        loadingView.isHidden = false
    }

    // Call this method to show loadingView
    func hide(){
        loadingView.isHidden = true
    }

    // Call this method to check if loading view already exists
    func isHidden() -> Bool{
        if loadingView.isHidden == false{
            return false
        }
        else{
            return true
        }
    }
}
