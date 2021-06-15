//
//  Data.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI
import ChameleonFramework

let currencyImages : [String] = ["currency_1", "currency_2", "currency_3", "currency_4", "currency_5", "currency_6", "currency_7", "currency_8", "currency_9", "currency_10", "currency_11", "currency_12", "currency_13", "currency_14", "currency_15", "currency_16"]

let welcomingWords : [String] = ["Ultra light and simple Exchange Currency App!", "Totally free and easy to use!", "Thank you for downloaded this app! click below"]

let currenciesIso : [String] = ["AED" ,"AFN" ,"ALL" ,"AMD" ,"ANG" ,"AOA" ,"ARS" ,"AUD" ,"AWG" ,"AZN" ,"BAM" ,"BBD" ,"BDT" ,"BGN" ,"BHD" ,"BIF" ,"BMD" ,"BND" ,"BOB" ,"BRL" ,"BSD" ,"BTC" ,"BTN" ,"BWP" ,"BYN" ,"BZD" ,"CAD" ,"CDF" ,"CHF" ,"CLF" ,"CLP" ,"CNH" ,"CNY" ,"COP" ,"CRC" ,"CUC" ,"CUP" ,"CVE" ,"CZK" ,"DJF" ,"DKK" ,"DOP" ,"DZD" ,"EGP" ,"ERN" ,"ETB" ,"EUR" ,"FJD" ,"FKP" ,"GBP" ,"GEL" ,"GGP" ,"GHS" ,"GIP" ,"GMD" ,"GNF" ,"GTQ" ,"GYD" ,"HKD" ,"HNL" ,"HRK" ,"HTG" ,"HUF" ,"IDR" ,"ILS" ,"IMP" ,"INR" ,"IQD" ,"IRR" ,"ISK" ,"JEP" ,"JMD" ,"JOD" ,"JPY" ,"KES" ,"KGS" ,"KHR" ,"KMF" ,"KPW" ,"KRW" ,"KWD" ,"KYD" ,"KZT" ,"LAK" ,"LBP" ,"LKR" ,"LRD" ,"LSL" ,"LYD" ,"MAD" ,"MDL" ,"MGA" ,"MKD" ,"MMK" ,"MNT" ,"MOP" ,"MRO" ,"MRU" ,"MUR" ,"MVR" ,"MWK" ,"MXN" ,"MYR" ,"MZN" ,"NAD" ,"NGN" ,"NIO" ,"NOK" ,"NPR" ,"NZD" ,"OMR" ,"PAB" ,"PEN" ,"PGK" ,"PHP" ,"PKR" ,"PLN" ,"PYG" ,"QAR" ,"RON" ,"RSD" ,"RUB" ,"RWF" ,"SAR" ,"SBD" ,"SCR" ,"SDG" ,"SEK" ,"SGD" ,"SHP" ,"SLL" ,"SOS" ,"SRD" ,"SSP" ,"STD" ,"STN" ,"SVC" ,"SYP" ,"SZL" ,"THB" ,"TJS" ,"TMT" ,"TND" ,"TOP" ,"TRY" ,"TTD" ,"TWD" ,"TZS" ,"UAH" ,"UGX" ,"USD" ,"UYU" ,"UZS" ,"VES" ,"VND" ,"VUV" ,"WST" ,"XAF" ,"XAG" ,"XAU" ,"XCD" ,"XDR" ,"XOF" ,"XPD" ,"XPF" ,"XPT" ,"YER" ,"ZAR" ,"ZMW" ,"ZWL"]

let currencies: [[String]] = [["UAE Dirham","AED"],["Afghani","AFN"],["Lek","ALL"],["Armenian Dram","AMD"],["Netherlands Antillean Guilder","ANG"],["Kwanza","AOA"],["Argentine Peso","ARS"],["Australian Dollar","AUD"],["Aruban Florin","AWG"],["Azerbaijanian Manat","AZN"],["Convertible Mark","BAM"],["Barbados Dollar","BBD"],["Taka","BDT"],["Bulgarian Lev","BGN"],["Bahraini Dinar","BHD"],["Burundi Franc","BIF"],["Bermudian Dollar","BMD"],["Brunei Dollar","BND"],["Boliviano","BOB"],["Mvdol","BOV"],["Brazilian Real","BRL"],["Bahamian Dollar","BSD"],["Ngultrum","BTN"],["Pula","BWP"],["Belarussian Ruble","BYN"],["Belize Dollar","BZD"],["Canadian Dollar","CAD"],["Congolese Franc","CDF"],["WIR Euro","CHE"],["Swiss Franc","CHF"],["WIR Franc","CHW"],["Unidad de Fomento","CLF"],["Chilean Peso","CLP"],["Yuan Renminbi","CNY"],["Colombian Peso","COP"],["Unidad de Valor Real","COU"],["Costa Rican Colon","CRC"],["Peso Convertible","CUC"],["Cuban Peso","CUP"],["Cabo Verde Escudo","CVE"],["Czech Koruna","CZK"],["Djibouti Franc","DJF"],["Danish Krone","DKK"],["Dominican Peso","DOP"],["Algerian Dinar","DZD"],["Egyptian Pound","EGP"],["Nakfa","ERN"],["Ethiopian Birr","ETB"],["Euro","EUR"],["Fiji Dollar","FJD"],["Falkland Islands Pound","FKP"],["Pound Sterling","GBP"],["Lari","GEL"],["Ghana Cedi","GHS"],["Gibraltar Pound","GIP"],["Dalasi","GMD"],["Guinea Franc","GNF"],["Quetzal","GTQ"],["Guyana Dollar","GYD"],["Hong Kong Dollar","HKD"],["Lempira","HNL"],["Kuna","HRK"],["Gourde","HTG"],["Forint","HUF"],["Rupiah","IDR"],["New Israeli Sheqel","ILS"],["Indian Rupee","INR"],["Iraqi Dinar","IQD"],["Iranian Rial","IRR"],["Iceland Krona","ISK"],["Jamaican Dollar","JMD"],["Jordanian Dinar","JOD"],["Yen","JPY"],["Kenyan Shilling","KES"],["Som","KGS"],["Riel","KHR"],["Comoro Franc","KMF"],["North Korean Won","KPW"],["Won","KRW"],["Kuwaiti Dinar","KWD"],["Cayman Islands Dollar","KYD"],["Tenge","KZT"],["Kip","LAK"],["Lebanese Pound","LBP"],["Sri Lanka Rupee","LKR"],["Liberian Dollar","LRD"],["Loti","LSL"],["Libyan Dinar","LYD"],["Moroccan Dirham","MAD"],["Moldovan Leu","MDL"],["Malagasy Ariary","MGA"],["Denar","MKD"],["Kyat","MMK"],["Tugrik","MNT"],["Pataca","MOP"],["Ouguiya","MRU"],["Mauritius Rupee","MUR"],["Rufiyaa","MVR"],["Kwacha","MWK"],["Mexican Peso","MXN"],["Mexican Unidad de Inversion (UDI)","MXV"],["Malaysian Ringgit","MYR"],["Mozambique Metical","MZN"],["Namibia Dollar","NAD"],["Naira","NGN"],["Cordoba Oro","NIO"],["Norwegian Krone","NOK"],["Nepalese Rupee","NPR"],["New Zealand Dollar","NZD"],["Rial Omani","OMR"],["Balboa","PAB"],["Nuevo Sol","PEN"],["Kina","PGK"],["Philippine Peso","PHP"],["Pakistan Rupee","PKR"],["Zloty","PLN"],["Guarani","PYG"],["Qatari Rial","QAR"],["Romanian Leu","RON"],["Serbian Dinar","RSD"],["Russian Ruble","RUB"],["Rwanda Franc","RWF"],["Saudi Riyal","SAR"],["Solomon Islands Dollar","SBD"],["Seychelles Rupee","SCR"],["Sudanese Pound","SDG"],["Swedish Krona","SEK"],["Singapore Dollar","SGD"],["Saint Helena Pound","SHP"],["Leone","SLL"],["Somali Shilling","SOS"],["Surinam Dollar","SRD"],["South Sudanese Pound","SSP"],["Dobra","STN"],["El Salvador Colon","SVC"],["Syrian Pound","SYP"],["Lilangeni","SZL"],["Baht","THB"],["Somoni","TJS"],["Turkmenistan New Manat","TMT"],["Tunisian Dinar","TND"],["Pa’anga","TOP"],["Turkish Lira","TRY"],["Trinidad and Tobago Dollar","TTD"],["New Taiwan Dollar","TWD"],["Tanzanian Shilling","TZS"],["Hryvnia","UAH"],["Uganda Shilling","UGX"],["US Dollar","USD"],["US Dollar (Next day)","USN"],["Uruguay Peso en Unidades Indexadas (URUIURUI)","UYI"],["Peso Uruguayo","UYU"],["Uzbekistan Sum","UZS"],["Bolivar","VEF"],["Dong","VND"],["Vatu","VUV"],["Tala","WST"],["CFA Franc BEAC","XAF"],["East Caribbean Dollar","XCD"],["SDR (Special Drawing Right)","XDR"],["CFA Franc BCEAO","XOF"],["CFP Franc","XPF"],["Sucre","XSU"],["ADB Unit of Account","XUA"],["Yemeni Rial","YER"],["Rand","ZAR"],["Zambian Kwacha","ZMW"],["Zimbabwe Dollar","ZWL"]]

let colorsAvailableArray : [[Color]] =
    [[Color(UIColor.flatRed()),Color(UIColor.flatRedColorDark())],
     [Color(UIColor.flatOrange()),Color(UIColor.flatOrangeColorDark())],
     [Color(UIColor.flatYellow()),Color(UIColor.flatYellowColorDark())],
     [Color(UIColor.flatSand()),Color(UIColor.flatSandColorDark())],
     [Color(UIColor.flatNavyBlue()),Color(UIColor.flatNavyBlueColorDark())],
     [Color(UIColor.flatBlack()),Color(UIColor.flatBlackColorDark())],
     [Color(UIColor.flatMagenta()),Color(UIColor.flatMagentaColorDark())],
     [Color(UIColor.flatTeal()),Color(UIColor.flatTealColorDark())],
     [Color(UIColor.flatSkyBlue()),Color(UIColor.flatSkyBlueColorDark())],
     [Color(UIColor.flatGreen()),Color(UIColor.flatGreenColorDark())],
     [Color(UIColor.flatMint()),Color(UIColor.flatMintColorDark())],
     [Color(UIColor.flatWhite()),Color(UIColor.flatWhiteColorDark())],
     [Color(UIColor.flatGray()),Color(UIColor.flatGrayColorDark())],
     [Color(UIColor.flatForestGreen()),Color(UIColor.flatForestGreenColorDark())],
     [Color(UIColor.flatPurple()),Color(UIColor.flatPurpleColorDark())],
     [Color(UIColor.flatBrown()),Color(UIColor.flatBrownColorDark())],
     [Color(UIColor.flatPlum()),Color(UIColor.flatPlumColorDark())],
     [Color(UIColor.flatWatermelon()),Color(UIColor.flatWatermelonColorDark())],
     [Color(UIColor.flatLime()),Color(UIColor.flatLimeColorDark())],
     [Color(UIColor.flatPink()),Color(UIColor.flatPinkColorDark())],
     [Color(UIColor.flatMaroon()),Color(UIColor.flatMaroonColorDark())],
     [Color(UIColor.flatCoffee()),Color(UIColor.flatCoffeeColorDark())],
     [Color(UIColor.flatPowderBlue()),Color(UIColor.flatPowderBlueColorDark())],
     [Color(UIColor.flatBlue()),Color(UIColor.flatPowderBlueColorDark())]]
