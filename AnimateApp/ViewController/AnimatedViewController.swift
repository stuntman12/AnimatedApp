
import UIKit
import SpringAnimation

final class AnimatedViewController: UIViewController {
    
    private var animation = Animation.getAnimation()

    private let animatedButton = SpringButton()
    private let animatedView = SpringButton()
    
    private let presentLabel = UILabel()
    private let curveLabel = UILabel()
    private let forceLabel = UILabel()
    private let durationLabel = UILabel()
    private let delayLabel = UILabel()
    
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @objc
    private func goAnimated() {
        
        animatedView.animation = animation.animation
        animatedView.curve = animation.curva
        animatedView.force = animation.force
        animatedView.duration = animation.duration
        animatedView.delay = animation.delay
        animatedView.animate()
        
        presentLabel.text = "Preset: \(animation.animation)"
        curveLabel.text = "Curve: \(animation.curva)"
        durationLabel.text = "Duration: \(animation.duration)"
        forceLabel.text = "Force: \(animation.force)"
        delayLabel.text = "Delay: \(animation.delay)"
        animation = Animation.getAnimation()
        animatedButton.setTitle("Next: \(animation.animation)" ,for: .normal)
    }
}

private extension AnimatedViewController {
    func setupView() {
        view.backgroundColor = .white
        
        addSubViews()
        addActions()
        
        setupUiView()
        setupStackView()
        setupLabel()
        setupButton()
        
        setupLayout()
    }
}

private extension AnimatedViewController {
    func addSubViews() {
        [
            animatedView,
            animatedButton,
            presentLabel,
            stackView
        ].forEach { view.addSubview($0) }
    }
    
    func addActions() {
        animatedButton.addTarget(self, action: #selector(goAnimated), for: .touchUpInside)
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        let contentsInStack = [presentLabel, curveLabel, forceLabel, durationLabel, delayLabel]
        
        contentsInStack.forEach { stackView.addArrangedSubview($0)}
    }
    
    func setupButton() {
        animatedButton.setTitle("Tap me", for: .normal)
        animatedButton.tintColor = .white
        animatedButton.layer.cornerRadius = 15
        animatedButton.backgroundColor = .systemBlue
    }
    
    func setupUiView() {
        animatedView.backgroundColor = .systemBlue
        animatedView.layer.borderWidth = 2
        animatedView.layer.cornerRadius = 15
    }
    
    func setupLabel() {
        presentLabel.text = ""
        curveLabel.text = ""
        forceLabel.text = ""
        durationLabel.text = ""
        delayLabel.text = ""
        
        let contentsInStack = [presentLabel, curveLabel, forceLabel, durationLabel, delayLabel]
        
        contentsInStack.forEach { $0.font = UIFont.systemFont(ofSize: 20)}
        contentsInStack.forEach { $0.textAlignment = .justified }
        contentsInStack.forEach { $0.numberOfLines = 1 }
    }
    
}
private extension AnimatedViewController {
    func setupLayout() {
        [
            animatedView,
            presentLabel,
            animatedButton,
            stackView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            animatedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            animatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            animatedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            animatedView.heightAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: animatedView.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            animatedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            animatedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            animatedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            animatedButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
