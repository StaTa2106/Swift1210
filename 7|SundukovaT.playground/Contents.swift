/*Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.*/
class Revenue {
    var earningsPerMonth = [
        "January": 10000,
        "February": 2000,
        "March": 0]
    func countEarnings (atMonthes month: String) -> Int? {
        return earningsPerMonth [month]
    }
    func averageRevenue () -> Int {
        guard earningsPerMonth.count > 0 else {
            return 0
        }
        var revenueTotal = 0
        for month in earningsPerMonth {
            revenueTotal += month.value
        }
        return revenueTotal / earningsPerMonth.count
    }
}

let revenue = Revenue()
revenue.countEarnings(atMonthes: "March")
revenue.countEarnings(atMonthes: "May")
revenue.averageRevenue()


/*Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.*/
enum ShopError: Error {
    case invalidSelection
    case outOfStock
    case InsufficientFunds (coinsNeeded: Int)
}
struct Item {
    var price: Int
    var count: Int
}
class Shop {
    var inventory = [
        "The Importance of Being Earnest": Item (price: 1000, count: 7),
        "The Picture of Dorian Gray": Item(price: 300, count: 0),
        "The Happy Prince": Item(price: 500, count: 4),
        "Salomé": Item(price: 1200, count: 7)
    ]
    var coinsDeposited: Int
    init (coinsDeposited: Int) {
        self.coinsDeposited = coinsDeposited
    }
    func dispense (book: String) {
        print("Выдана книга \(book)")
    }
    func vend(itemNamed name: String) -> (Item?, ShopError?) {
        guard var item = inventory [name] else {
            print("Такой книги нет в продаже")
            return (nil, ShopError.invalidSelection)
        }
        guard item.count > 0 else {
            print("Эта книга раскуплена")
            return (nil, ShopError.outOfStock)
        }
        guard item.price <= coinsDeposited else {
            print("Недостаточно денег, внесите еще \(item.price - coinsDeposited) рублей")
            return (nil, ShopError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited))
        }
        print("На Вашем счете \(coinsDeposited) рублей")
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispense(book: name)
        return (item.self, nil)
    }
}
var shop = Shop(coinsDeposited: 2000)
let sell3 = shop.vend(itemNamed: "The Importance of Being Earnest")
let sell4 = shop.vend(itemNamed: "The Happy Prince")
let sell5 = shop.vend(itemNamed: "A Rose")
shop = Shop(coinsDeposited: 100)
let sell6 = shop.vend(itemNamed: "The Importance of Being Earnest")

// Пример: Погашение кредиторской задолженности предприятием
struct Debt {
    var amountPayable: Int
    var periodForPayment: Int
    var name: Company
}
struct Company {
    var name: String
}
class Creditors {
    var liabilities = [
        "Ромашка ООО": Debt (amountPayable: 1000, periodForPayment: 2,name: Company(name: "Ромашка ООО")),
        "Иванов ИП": Debt(amountPayable: 400, periodForPayment: 2, name: Company (name: "Иванов ИП")),
        "Бюджет": Debt(amountPayable: 100, periodForPayment: 3, name: Company(name: "Бюджет"))
    ]
    var account = 0
    init (account: Int) {
        self.account = account
    }
    
    func payment(creditorNamed name: String) throws -> Company {
        guard var creditor = liabilities [name] else {
            throw ShopError.invalidSelection
        }
        guard creditor.periodForPayment > 0 else {
            throw ShopError.outOfStock
        }
    
        guard (creditor.amountPayable / creditor.periodForPayment) <= account else {
            throw ShopError.InsufficientFunds (coinsNeeded: creditor.amountPayable - account)
        }
        
        print("На счете \(account) рублей")
        print("Частиная оплата задолженности в размере \(creditor.amountPayable / creditor.periodForPayment) кредитору  \(name)")
        account -= creditor.amountPayable / creditor.periodForPayment
        creditor.amountPayable -= (creditor.amountPayable / creditor.periodForPayment)
        creditor.periodForPayment -= 1
        liabilities[name] = creditor
        return creditor.name
    }
}
var pay = Creditors(account: 4000)
do {
    _ = try pay.payment(creditorNamed: "Ромашка ООО")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Недостаточно денег на счете для частичной оплаты задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}
do {
    _ = try pay.payment(creditorNamed: "Ромашка ООО")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}
do {
    _ = try pay.payment(creditorNamed: "Ромашка ООО")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}
do {
    _ = try pay.payment(creditorNamed: "Иванов ИП")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
}
do {
    _ = try pay.payment(creditorNamed: "Подорожник ЗАО")
}catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
}
do {
    _ = try pay.payment(creditorNamed: "Бюджет")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}
do {
    _ = try pay.payment(creditorNamed: "Бюджет")
} catch ShopError.invalidSelection {
    print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
    print("Эта задолженность полностью погашена")
}
do {
_ = try pay.payment(creditorNamed: "Бюджет")
} catch ShopError.invalidSelection {
print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
print("Эта задолженность полностью погашена")
}
do {
_ = try pay.payment(creditorNamed: "Бюджет")
} catch ShopError.invalidSelection {
print("Такого кредитора не существует")
} catch ShopError.InsufficientFunds(let coinsNeeded) {
print("Введенная сумма недостаточна для полного погашения задолженности. Необходимо еще \(coinsNeeded) рублей.")
} catch ShopError.outOfStock {
print("Эта задолженность полностью погашена")
}
