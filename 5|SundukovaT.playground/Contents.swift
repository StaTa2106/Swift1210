//: A UIKit based Playground for presenting user interface
enum IsDoor {
    case open, closed, broken
}
protocol Machine {
    var maxLoad: Int {get}
    var cleanser: Float {get}
    func door(action: IsDoor)
    func finish(action: String) -> String
}
extension Machine {
    func door(action: IsDoor) {
        switch action {
        case .open:
            print("Закройте дверцу машины!")
        case .closed:
            print("Дверца закрыта, нажмите клавишу СТАРТ")
        case .broken:
            print("Дверца сломана, машина не может начать работу")
        }
    }
}
extension Machine {
    func finish(action: String) -> String {
        if action == "stop" {
            return "Пииип, машина закончила работу"
        }
        else {
            return "Машина продолжает цикл"
        }
    }
}
protocol Bosh {
    var brand: String {get}
    var country: String {get}
}
extension Bosh {
    var brand: String {
        return "Bosh"
    }
    var country: String {
        return "China"
    }
}
protocol Electrolux {
    var brand: String {get}
    var country: String {get}
}
extension Electrolux {
    var brand: String {
        return "Electrolux"
    }
    var country: String {
        return "Germany"
    }
}
protocol OverLoad  {
    func overLoad()
}
extension WashingMachine: CustomStringConvertible {
    var description: String {
        return ("""
            Использование: \(mainUse)
            Максимальная загрузка \(maxLoad) кг
            Понадобится \(cleanser) кг моющего средства
            Производитель: \(brand), \(country)
            """)
    }
}

class WashingMachine: Machine, Bosh {
    var maxLoad: Int {
        return 5
    }
     var cleanser: Float {
         return (Float(self.loaded) / 100)
     }
     var mainUse = "стирка белья."
     var loaded: Int
    init(loaded: Int) {
        self.loaded = loaded
    }
}
extension WashingMachine: OverLoad {
        func overLoad () {
        if loaded > maxLoad {
            print("Перевес \(loaded - maxLoad) кг! Машина не может начать работу!")
            loaded = maxLoad
        }
    }
    
}
extension DishWasher: CustomStringConvertible {
    var description: String {
        return ("""
        Использование: \(mainUse)
        Максимальная загрузка \(maxLoad) комплектов посуды
        Понадобится \(cleanser) порций моющего средства
        Производитель: \(brand), \(country)
        """)
    }
}
    
class DishWasher: Machine, Electrolux {
    var loaded: Int
    var mainUse = "мытье посуды"
    var maxLoad: Int {
        return 12
        }
    var cleanser: Float {
        return (Float(self.maxLoad) / 12)
    }
    
    init (loaded: Int) {
        self.loaded = loaded
    }
}

var wash1 = WashingMachine(loaded:6)
print(wash1.description)
wash1.overLoad()
print(wash1.loaded)
wash1.door(action: .open)
print(wash1.finish(action: "start"))
var dish1 = DishWasher(loaded: 10)
print(dish1.description)
dish1.door(action: .broken)
print(dish1.finish(action: "stop"))

