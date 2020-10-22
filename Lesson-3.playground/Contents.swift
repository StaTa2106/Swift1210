//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

// Структура1 - легковой автомобиль
enum CarEngine: String {
    case start, stop
}
enum BeltFasten {
    case fastened, unfastened
    
}
enum AddLuggage: String {
    case full = "Для багажа нет места"
    case empty = "Добавьте багаж"
}

struct Car {
    var type: String
    var year: Int
    var luggugeInCar: Int
    var engine: CarEngine
    var spaceTrunk: AddLuggage
    var belt: BeltFasten {
        willSet {
            if newValue == .unfastened {
                print("Водитель автомобиля \(self.type): Пристегните ремень безопасности!")
            } else {
                print("Водитель автомобиля \(self.type): Вы пристегнуты.")
            }
        }
    }
    
    func description() {
        print("""
            Автомобиль марки \(self.type) (год выпуска \(self.year)):
            \(self.engine),
            \(self.spaceTrunk.rawValue).
            """)
    }
    
    mutating func moreLuggage(wantToPut: Int) {
        if luggugeInCar < 4 {
            print("Вы можете добавить \(4 - self.luggugeInCar) места багажа")
        }
    }
}

var car1 = Car(type: "BMW", year: 2018, luggugeInCar: 2, engine: .start, spaceTrunk: .full, belt: .unfastened)
var car2 = Car(type: "Lada", year: 2000, luggugeInCar: 0, engine: .stop, spaceTrunk: .empty, belt: .unfastened)
car1.description()
car2.description()
car2.belt = .unfastened
car1.belt = .fastened
car2.description
car1.moreLuggage(wantToPut: 2)
car2.moreLuggage(wantToPut: 4)


// Структура2 - грузовой автомобиль

enum TrunkClose {
    case closed, opened
}

struct TrunkCar {
    var model: String
    var year: Int
    var trunk = 4000
    var weightInCar: Int
    var amountPassengers: Int
    var trunkClosed: TrunkClose {
        willSet {
            if newValue == .opened {
                print("Водитель автомобиля \(self.model): Закройте грузовой отсек!")
            } else {
                print("Водитель автомобиля \(self.model): Грузовой отсек закрыт.")
            }
        }
    }
    
    func description() {
        print("""
            Грузовой автомобиль марки \(self.model) (год выпуска \(self.year)):
            Вес багажа: \(self.weightInCar),
            Количество пассажиров: \(self.amountPassengers).
            """)
    }
    
    mutating func moreCargo(wantToPut: Int) {
        if (weightInCar + amountPassengers) < self.trunk {
            print("Вы можете добавить \(trunk - self.weightInCar - amountPassengers * 80) кг груза")
        }
    }
}

var trunkCar1 = TrunkCar(model: "MAZ", year: 2000, trunk: 4000, weightInCar: 500, amountPassengers: 2, trunkClosed: .closed)
var trunkCar2 = TrunkCar(model: "KAMAZ", year: 2018, trunk: 2000, weightInCar: 0, amountPassengers: 3, trunkClosed: .opened)
trunkCar1.description()
trunkCar2.description()
trunkCar2.trunkClosed = .closed
trunkCar1.trunkClosed = .opened
trunkCar1.description
trunkCar1.moreCargo(wantToPut: 2000)
trunkCar2.moreCargo(wantToPut: 4000)


