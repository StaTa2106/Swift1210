//: A UIKit based Playground for presenting user interface

enum Action: String {
    case washClothes = "Эта машина предназначена для стирки белья."
    case washDishes = "Эта машина предназначена для мытья посуды."
}
enum Option {
    case handwash, drying, intensive
}
enum IsDoor {
    case open
    case close
}
class Machine {
    var mainUse: Action
    var isEngine: Bool = false {
        willSet {
            print("Машина включена, новое значение - \(newValue)")
        }
        didSet {
            print("Состояние изменилось.")
        }
    }
    var maxLoad: Int
    var loaded: Int
    var cleanser: String {
        get {
            return ("Понадобится \(Float(self.loaded) / 100) кг моющего средства")
        }
    }
    var door: IsDoor
    init(mainUse: Action, isEngine: Bool, maxLoad: Int, loaded: Int, door: IsDoor) {
        self.isEngine = isEngine
        self.maxLoad = maxLoad
        self.loaded = loaded
        self.mainUse = mainUse
        self.door = door
    }
    
    func info() {
        print("\(self.mainUse.rawValue)")
    }
    func handleAction() {}
    
    final func workHours(timeHours: Float) {
        if timeHours > 2 {
            print("Продолжительность цикла не более 2 часов")
        } else {
            print("Продолжительность цикла \(timeHours) часов")
        }
    }
}

class WashingMachine: Machine {
    var specialOption: Option
    init(specialOption: Option, isEngine: Bool, loaded: Int, door: IsDoor) {
        self.specialOption = specialOption
        super.init(mainUse: .washClothes, isEngine: isEngine, maxLoad: 5, loaded: loaded, door: door)
    }
    override func handleAction() {
        print("Загрузите одежду для стирки, максимальная загрузка - \(self.maxLoad) кг")
    }
    
    func overLoad () {
        if loaded > maxLoad {
            print("Перевес \(loaded - maxLoad) кг! Машина не может начать работу!")
            loaded = maxLoad
        }
    }
    func openDoor(action: IsDoor) {
        switch action {
        case .open:
            print("Нельзя начинать стирку! Закройте дверцу машины!")
        case .close:
            print("Дверца закрыта, нажмите клавишу СТАРТ")
        }
    }
}

class DishWasher: Machine {
    var specialOption: Option

    init(specialOption: Option, isEngine: Bool, loaded: Int, door: IsDoor) {
        self.specialOption = specialOption
        super.init(mainUse: .washDishes, isEngine: isEngine, maxLoad: 12, loaded: loaded, door: door)
    }
    override func handleAction() {
        print("Загрузите грязную посуду, максимальная загрузка - \(maxLoad) комплектов")
    }
    
    func asleep(time: Int) {
        print("Подключена функция отложенной работы, машина начнет работать через \(time) мин")
    }
}
var wash1 = WashingMachine(specialOption: .handwash, isEngine: false, loaded: 6, door: .open)
wash1.info()
wash1.handleAction()
wash1.openDoor(action: .open)
wash1.loaded
wash1.cleanser
wash1.overLoad()
print(wash1.cleanser)
wash1.specialOption
wash1.workHours(timeHours: 3.0)
wash1.isEngine.toggle()

var dish1 = DishWasher(specialOption: .intensive, isEngine: true, loaded: 10, door: .close)
dish1.info()
dish1.handleAction()
print(dish1.cleanser)
dish1.asleep(time: 60)
dish1.workHours(timeHours: 1.5)
dish1.isEngine
dish1.isEngine.toggle()
dish1.isEngine.toggle()
