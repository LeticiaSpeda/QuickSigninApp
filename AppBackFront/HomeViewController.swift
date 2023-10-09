import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedOneButton()
    func tappedTwoButton()
}

final class HomeViewController: UIViewController {
    private weak var delegate: HomeScreenProtocol?
    
    private lazy var optionOneButton: UIButton = {
        let image = UIImage(systemName: "bus")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(handleTappeOneButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var optionTwoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "car.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.tintColor = .cyan
        button.addTarget(self, action: #selector(handleTappeTwoButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureObserverNotification()
    }
    
    @objc func handleTappeOneButton() {
        delegate?.tappedOneButton()
        NotificationCenter.default.post(name: Notification.Name("One"), object: UIColor.black)
    }
    
    @objc func handleTappeTwoButton() {
        delegate?.tappedTwoButton()
        NotificationCenter.default.post(name: Notification.Name("Two"), object: UIColor.gray)
    }
    
    @objc func handleNotificationOne(notification: NSNotification) {
        view.backgroundColor = notification.object as? UIColor
    }
    
    @objc func handleNotificationTwo(notification: NSNotification) {
        view.backgroundColor = notification.object as? UIColor
    }
    
    private func delegate(_ delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    private func configureObserverNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationOne), name: Notification.Name("One"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationTwo), name: Notification.Name("Two"), object: nil)
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        view.addSubview(optionOneButton)
        view.addSubview(optionTwoButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            optionOneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            optionOneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            optionOneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            optionOneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            optionOneButton.widthAnchor.constraint(equalToConstant: 100),
            optionOneButton.heightAnchor.constraint(equalToConstant: 100),
            
            optionTwoButton.topAnchor.constraint(equalTo: optionOneButton.bottomAnchor, constant: 20),
            optionTwoButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            optionTwoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }

    private func configureStyle() {
        view.backgroundColor = .systemPink
    }
}
