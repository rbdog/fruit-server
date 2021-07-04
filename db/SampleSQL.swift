
/*

 swiftc SampleSQL.swift -o /path/to/samplesql
 のように書くとコンパイル後、 指定したパスに実行ファイルが作成される
 
 パスを通す手羽が省けるおすすめは /usr/local/bin/ に生成すること
 swiftc SampleSQL.swift -o /usr/local/bin/samplesql
 
 */

import Foundation

let newFile = (FileManager.default.currentDirectoryPath as NSString).appendingPathComponent("setup.sql")
if FileManager.default.fileExists(atPath: newFile) {
    print("既に存在しています。置き換えはしませんでした。")
}
else {
    FileManager.default.createFile(atPath: newFile,
                                   contents: Fruits.randomInsertSql.data(using: .utf8),
                                   attributes: nil)
    print("サンプルデータのSQLを作成しました。setup.sql")
}

enum Fruits {
    enum Name: CaseIterable {
        case apple
        case strawberry
        case peach
        case grape
        case melon
        case mango
        case orange
        case pineapple
        case banana
        case cherry
        case buleberry
        case lemon
        case dragonfruit
        
        var katakana: String {
            switch self {
            case .apple: return "リンゴ"
            case .strawberry: return "イチゴ"
            case .peach: return "モモ"
            case .grape: return "ブドウ"
            case .melon: return "メロン"
            case .mango: return "マンゴー"
            case .orange: return "オレンジ"
            case .pineapple: return "パイナップル"
            case .banana: return "バナナ"
            case .cherry: return "チェリー"
            case .buleberry: return "ブルーベリー"
            case .lemon: return "レモン"
            case .dragonfruit: return "ドラゴンフルーツ"
            }
        }
    }
    
    // 20 - 600 でランダムな整数。10刻み。
    static func randomPrice() -> Int {
        let randomInt = Int.random(in: 2...60)
        return randomInt * 10
    }
    
    // 2000/01/01 - 2020/12/31 でランダムな日時
    static func randomDate() -> Date {
        let start = Date("2000", "01", "01", "00", "00", "00", "+09:00")!
        let end = Date("2020", "12", "31", "23", "59", "59", "+09:00")!
        let randomTimeInterval = TimeInterval.random(in: start.timeIntervalSinceNow...end.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: randomTimeInterval)
    }
    
    static var sqlPrefix: String {
        let sql = """
            CREATE TABLE fruits
            (
               id SERIAL NOT NULL,
               name varchar(255) NOT NULL,
               price Integer,
               created_at TIMESTAMP,
               updated_at TIMESTAMP,
               PRIMARY KEY (id)
            );

            INSERT INTO fruits (name, price, created_at, updated_at) VALUES
            """
        return sql
    }
    
    static var sqlSufix: String {
        return ";"
    }
    
    struct Record {
        var name: String
        var price: Int
        var createdAt: Date
        var updatedAt: Date
        
        var sql: String {
            let record = """
                (
                  '\(name)',
                  \(price),
                  TO_TIMESTAMP('\(createdAt.pgTimeStamp)', 'YYYY/MM/DD HH24:MI:SS'),
                  TO_TIMESTAMP('\(updatedAt.pgTimeStamp)', 'YYYY/MM/DD HH24:MI:SS')
                )
                """
            return record
        }
        
        static var random: Self {
            let date0 = randomDate()
            let date1 = randomDate()
            return Self.init(name: Name.allCases.randomElement()!.katakana,
                             price: randomPrice(),
                             createdAt: min(date0, date1),
                             updatedAt: max(date0, date1))
        }
    }
    
    static var firstRecord: Record {
        // 現地時間ではなく日本時間にしてしまう
        return Record(name: Name.apple.katakana,
                      price: 120,
                      createdAt: Date("2007", "01", "09", "09", "42", "00", "+09:00")! ,
                      updatedAt: Date("2010", "01", "27", "09", "41", "00", "+09:00")!)
    }
    
    static var randomInsertSql: String {
        var records = [firstRecord]
        for _ in 0...50 {
            records.append(Record.random)
        }
        let insertSQLs = records.map {$0.sql}
        let sqlMain = insertSQLs.joined(separator: ",")
        return sqlPrefix + sqlMain + sqlSufix
    }
}

extension Date {
    /// Z: "+09:00"
    init?(_ yyyy: String, _ MM: String, _ dd: String, _ HH: String, _ mm: String, _ ss: String, _ Z: String) {
        let dateString = "\(yyyy)/\(MM)/\(dd) \(HH):\(mm):\(ss) \(Z)"
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
}

fileprivate extension Date {
    var pgTimeStamp: String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // PostgreSQL にてTimeZoneなしの型を採用しているのに合わせる
        formatter.dateFormat =  "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: self)
    }
}

