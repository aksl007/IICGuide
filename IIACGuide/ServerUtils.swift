//
//  ServerUtils.swift
//  incheon
//
//  Created by DD Dev on 2020/07/30.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import Alamofire

class ServerUtils{
    
    static let REAL_URL:String = "https://incheonairportguide.airport.kr:11010"
    static let serverUrl:String = "https://incheonairportguide.airport.kr:11010/mobile-api/"
    static let serverBeaconUrl:String = "https://incheonairportguide.airport.kr:11010/beacon-api/"
    
    static let apiKey:String = "dQ9IeZUPLF9kbhm2zANcXH9Q9y0hCfH8"
    
    
    //api address
    static let bookmarksDevice:String = "bookmarks/device" //setDeviceInfo
    static let registerBookmark:String = "bookmarks" //registerBookmark
    static let deleteBookmark:String = "bookmarks/" //deleteBookmark @Path("fimsId") String fimsId
    static let updateBagBookmark:String = "bookmarks/brs" //updateBagBookmark
    
    static let setBeaconPlan:String = "beacon/beaconplan" //setBeaconPlan
    static let setPassenger:String = "beacon/passenger" //setPassenger
    
    
    static let flightsDepartures:String = "flights/departures" //getFlightDep
    static let flightsArrivals:String = "flights/arrivals" //getFlightArr searchFlightArr
    
    static let flightsDeparturesDetail:String = "flights/departures/" //getFlightDepDetail
    static let flightsArrivalsDetail:String = "flights/arrivals/" //getFlightArrDetail
    
    static let flightsAirports:String = "flights/airports" //getFlightSearchAirport
    static let flightsAirlines:String = "flights/airlines" //getFlightSearchAirline
    
    static let parkingCongestion:String = "parking/congestion" //getParkingCongestionInfo 주차가능 현황
    static let congestionDepartures:String = "congestion/departures/" //getDepCongestionInfo 출국장 혼잡도 + {terminalId}
    static let congestionArrivalsEntryInfos:String = "congestion/arrivals/entryInfos/" //getArrCongestionInfo 입국심사 혼잡도 + {terminalId}
    static let congestionEntryMovementTims:String = "congestion/entryMovementTims/" //getEntryMoveTimeInfo 입국심사 혼잡도 entryMovementTims + {terminalId}
    static let passenger:String = "passenger/" //getPassengerInfo, getMyPlanPassengerInfo 승객예고 passenger/{terminalId}/{departures}
    static let parkingPaymentCars:String = "parking/payment/cars/" //getParkingFeeCarNoInfo 요금결제 parking/payment/cars/{terminal}
    static let parkingPaymentFee:String = "parking/payment/fee/" //getParkingPaymentInfo 요금결제 parking/payment/fee/{terminal}
    static let parkingCars:String = "parking/cars/" //getParkingLocationInfo 내차위치 parking/cars/{terminal}/{carNo}
    
    static let transportationBuses:String = "transportation/buses" //getBusInfo bus detail
    static let transportationBusesForRoute:String = "transportation/buses/" //getBusDetailInfo bus route detail transportation/buses/{terminalId}/{busId}
    static let transportationBusesRouteStops:String = "transportation/buses/routeStops" //getBusRouteStopInfo bus stop transportation/buses/{terminalId}/{busId}
    static let transportationBusesTimeTable:String = "transportation/buses/timeTable/" //getBusTimeTableInfo bus time transportation/buses/timeTable/{terminalId}/{busId}
    static let transportationShuttleBusesStops:String = "transportation/shuttle/buses/stops/" //getShuttleBusStopTimeInfo shuttle time transportation/shuttle/buses/stops/{stopId}
    static let transportationTrainsTimeTable:String = "transportation/trains/timeTable/" //getArexTimeInfo arex time transportation/trains/timeTable/{terminalId}/{date}
    static let transportationTaxis:String = "transportation/taxis/" //getTaxiWaitInfo taxi wait transportation/taxis/{terminalId}

    static let flightsAirbrsTag:String = "flights/airbrs/tag" // getAirBrsBagTag flights/airbrs/tag
    
    static let establishmentsNative:String = "establishments/native" // getEstablishment establishments/native @Query("updateDateTime")
    static let campaigns:String = "campaigns" // getCampaign campaigns @Query("name") String name, @Query("createdDate") String createdDate, @Query("publisherName") String publisherName, @Query("campaignType") String campaignType, @Query("status") String status, @Query("enterpriseId") String enterpriseId, @Query("storeId") String storeId)
    static let establishmentsMap:String = "establishments/map/" // getMap establishments/map/{terminalId}
    static let notices:String = "notices" //getNotice notices
    
    static let searchCount:String = "search/count" //getSearchCount @Query("keyword")
    
    static let searchDepartures:String = "search/departures" //getSearchDepFlight @Query("keyword")
    static let searchArrivals:String = "search/arrivals" //getSearchArrFlight @Query("keyword")
    static let searchBuses:String = "search/buses" //getSearchBus @Query("keyword")
    static let searchSlides:String = "search/slides" //getSearchSlide @Query("keyword")
    
    static let getFlightDepSeason:String = "flights/season/departures" //getFlightDepSeason @Query("flightDate") @Query("destinationAirportCode")
    static let getFlightArrSeason:String = "flights/season/arrivals" //getFlightArrSeason @Query("flightDate") @Query("originAirportCode")
    
    static let getShuttleBusTimeInfo:String = "transportation/shuttle/buses/" //getShuttleBusTimeInfo {busId}
    
    //web link start
    static let URL_PARKING_RESERVE:String = "https://parking.airport.kr/reserve"
    static let URL_PARKING_FEE:String = "https://www.airport.kr/ap_lp/ko/tpt/parinf/parfeeinf/parfeeinf.do"
    
    static let PARKING_URL:String = "http://incheonairportguide.airport.kr:11020/parkingpay"
    static let URL_WEB_PAY:String = "/parking_pay/order?"
    
    static let URL_T1_VALET_PARKING:String = "https://valet.airport.kr"
    static let URL_T2_VALET_PARKING:String = "https://v.ajpark.co.kr/"
    
    static let URL_INTERNATIONAL_TAXI:String = "http://www.intltaxi.co.kr"
    static let URL_KOREA_TAXI:String = "http://www.koreataxi.kr/koreataxi/main/mainPage.do"
    
    static let URL_AVSC:String = "https://avsec.ts2020.kr/avsc/main.do"
    
    static let URL_AIR_CHAT_BOT:String = "https://airbot.kr/airBot/airbot.do?type=m"
    
    static let URL_AREX:String = "https://www.arex.or.kr"
    static let URL_CALT:String = "http://www.calt.co.kr"
    static let URL_KORAIL:String = "https://www.letskorail.com/ebizcom/cs/guide/terminal/terminal01.do"
    
    static let URL_TSP:String = "http://tsp.airport.kr/xmobile/jsp/index.jsp"
    
    static let URL_STAFF_BUS_RESERVE_1:String = "https://txbusi.t-money.co.kr/otck/trmlInfEnty.do"
    static let URL_STAFF_BUS_RESERVE_2:String = "https://txbusi.t-money.co.kr/mrs/cardNumEnty.do"
    static let URL_STAFF_BUS_RESERVE_3:String = "https://txbusi.t-money.co.kr/useinf/cashReceipt.do"
    
    static let URL_STAFF_BUS_ROUTE_INFO:String = "https://txbusi.t-money.co.kr/runinf/runInf.do"
    
    static let URL_STAFF_BUS_INFO_1:String = "https://txbusi.t-money.co.kr/useinf/mrsInfo.do"
    static let URL_STAFF_BUS_INFO_2:String = "https://txbusi.t-money.co.kr/useinf/cancInf.do"
    static let URL_STAFF_BUS_INFO_3:String = "https://txbusi.t-money.co.kr/useinf/cashReceipt.do"
    
    static let URL_STAFF_BUS_HELP_1:String = "https://txbusi.t-money.co.kr/support/notice.do"
    static let URL_STAFF_BUS_HELP_2:String = "https://txbusi.t-money.co.kr/support/faq.do"
    static let URL_STAFF_BUS_HELP_3:String = "https://txbusi.t-money.co.kr/support/question.do"


}
