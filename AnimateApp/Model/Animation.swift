
import Foundation

struct Animation {
    let animation: String
    let curva: String
    let force = Double(Int.random(in: Int(0.1)...5))
    let duration = Double(Int.random(in: Int(0.1)...5))
    let delay = Double(Int.random(in: 1...5))
    
    static func getAnimation() -> Animation {
        
        let animation = DataSourse.animation.shuffled()
        let curve = DataSourse.curva.shuffled()
        return Animation(animation: animation[0].rawValue, curva: curve[0].rawValue)
    }
}
