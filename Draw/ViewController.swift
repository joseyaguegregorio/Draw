import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    var buttonsColors: [UIButton]!
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Atrás", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        print("Undo lines drawn")
        
        canvas.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Borrar", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    @objc func handleClear() {
        canvas.clear()
    }
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blackButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let pinkButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let brownButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    @objc fileprivate func handleColorChange(button: UIButton) {
        buttonsColors.map{
            $0.layer.borderWidth=0
        }
        button.layer.borderWidth = 5
        if(button.backgroundColor == .black){
            button.layer.borderColor = UIColor.gray.cgColor
        }
        else{
            button.layer.borderColor = UIColor.black.cgColor
        }
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 25
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func handleSliderChange() {
        
        canvas.setStrokeWidth(width: slider.value)
    }
    
    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
        
        setupLayout()
    }

    fileprivate func setupLayout() {
        buttonsColors = [blackButton,yellowButton, pinkButton,purpleButton,redButton,brownButton, blueButton, greenButton, ]
        let colorsStackView = UIStackView(arrangedSubviews: buttonsColors)
        colorsStackView.distribution = .fillEqually
        
        let deletesStackView = UIStackView(arrangedSubviews: [undoButton, clearButton])
        deletesStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            deletesStackView,
            colorsStackView,
            slider,
            ])
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }

}

