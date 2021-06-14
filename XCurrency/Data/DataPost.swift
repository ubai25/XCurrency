//
//  DataPost.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 12/06/21.
//

import SwiftUI
import SwiftyJSON

struct DataPost: Codable, Identifiable{
    let id = UUID()
    var success: Bool
    var rates: Rate
}

struct Rate: Codable {
    var AED: Double?
    var AFN: Double?
    var ALL: Double?
    var AMD: Double?
    var ANG: Double?
    var AOA: Double?
    var ARS: Double?
    var AUD: Double?
    var AWG: Double?
    var AZN: Double?
    var BAM: Double?
    var BBD: Double?
    var BDT: Double?
    var BGN: Double?
    var BHD: Double?
    var BIF: Double?
    var BMD: Double?
    var BND: Double?
    var BOB: Double?
    var BRL: Double?
    var BSD: Double?
    var BTC: Double?
    var BTN: Double?
    var BWP: Double?
    var BYN: Double?
    var BZD: Double?
    var CAD: Double?
    var CDF: Double?
    var CHF: Double?
    var CLF: Double?
    var CLP: Double?
    var CNH: Double?
    var CNY: Double?
    var COP: Double?
    var CRC: Double?
    var CUC: Double?
    var CUP: Double?
    var CVE: Double?
    var CZK: Double?
    var DJF: Double?
    var DKK: Double?
    var DOP: Double?
    var DZD: Double?
    var EGP: Double?
    var ERN: Double?
    var ETB: Double?
    var EUR: Double?
    var FJD: Double?
    var FKP: Double?
    var GBP: Double?
    var GEL: Double?
    var GGP: Double?
    var GHS: Double?
    var GIP: Double?
    var GMD: Double?
    var GNF: Double?
    var GTQ: Double?
    var GYD: Double?
    var HKD: Double?
    var HNL: Double?
    var HRK: Double?
    var HTG: Double?
    var HUF: Double?
    var IDR: Double?
    var ILS: Double?
    var IMP: Double?
    var INR: Double?
    var IQD: Double?
    var IRR: Double?
    var ISK: Double?
    var JEP: Double?
    var JMD: Double?
    var JOD: Double?
    var JPY: Double?
    var KES: Double?
    var KGS: Double?
    var KHR: Double?
    var KMF: Double?
    var KPW: Double?
    var KRW: Double?
    var KWD: Double?
    var KYD: Double?
    var KZT: Double?
    var LAK: Double?
    var LBP: Double?
    var LKR: Double?
    var LRD: Double?
    var LSL: Double?
    var LYD: Double?
    var MAD: Double?
    var MDL: Double?
    var MGA: Double?
    var MKD: Double?
    var MMK: Double?
    var MNT: Double?
    var MOP: Double?
    var MRO: Double?
    var MRU: Double?
    var MUR: Double?
    var MVR: Double?
    var MWK: Double?
    var MXN: Double?
    var MYR: Double?
    var MZN: Double?
    var NAD: Double?
    var NGN: Double?
    var NIO: Double?
    var NOK: Double?
    var NPR: Double?
    var NZD: Double?
    var OMR: Double?
    var PAB: Double?
    var PEN: Double?
    var PGK: Double?
    var PHP: Double?
    var PKR: Double?
    var PLN: Double?
    var PYG: Double?
    var QAR: Double?
    var RON: Double?
    var RSD: Double?
    var RUB: Double?
    var RWF: Double?
    var SAR: Double?
    var SBD: Double?
    var SCR: Double?
    var SDG: Double?
    var SEK: Double?
    var SGD: Double?
    var SHP: Double?
    var SLL: Double?
    var SOS: Double?
    var SRD: Double?
    var SSP: Double?
    var STD: Double?
    var STN: Double?
    var SVC: Double?
    var SYP: Double?
    var SZL: Double?
    var THB: Double?
    var TJS: Double?
    var TMT: Double?
    var TND: Double?
    var TOP: Double?
    var TRY: Double?
    var TTD: Double?
    var TWD: Double?
    var TZS: Double?
    var UAH: Double?
    var UGX: Double?
    var USD: Double?
    var UYU: Double?
    var UZS: Double?
    var VES: Double?
    var VND: Double?
    var VUV: Double?
    var WST: Double?
    var XAF: Double?
    var XAG: Double?
    var XAU: Double?
    var XCD: Double?
    var XDR: Double?
    var XOF: Double?
    var XPD: Double?
    var XPF: Double?
    var XPT: Double?
    var YER: Double?
    var ZAR: Double?
    var ZMW: Double?
    var ZWL: Double?
}

class Api {
    func getPosts(){
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=USD&amount=1&symbols=IDR&places=2") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
//            guard let dataFix = data else { return }
//            let str = String(decoding: dataFix, as: UTF8.self)
            
            let weatherJSON : JSON = JSON(data)
            
            print(weatherJSON["rates"]["IDR"])
            
//            print("data : \(str)")
            
            let posts = try! JSONDecoder().decode(DataPost.self, from: data!)
            let rate: String = String(posts.rates.IDR ?? 0.00)
            
            print("rate = \(rate)")
            
        }.resume()
    }
}
