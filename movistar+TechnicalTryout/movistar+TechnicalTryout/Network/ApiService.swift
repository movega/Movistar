//
//  ApiService.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation

class ApiService: BaseApiService {
    
    let str1 = """
    {"channels":[{"id":3,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/A3.png","name":"Antena 3","live_program":{"id":24677,"title":"Espejo PÃºblico","end_time":"1659342600000","start_time":"1659335400000"}},{"id":1,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/TVE.png","name":"TVE","live_program":{"id":12304,"title":"Mundial FÃºtbol Femenino: EspaÃ±a - Italia","end_time":"1659344400000","start_time":"1659338100000"}},{"id":6,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/SEXTA.png","name":"La Sexta","live_program":{"id":12332,"title":"Al Rojo Vivo","end_time":"1659350700000","start_time":"1659338100000"}},{"id":2,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/LA2.png","name":"La 2","live_program":{"id":23451,"title":"Documentales Salvajes: El PterodÃ¡ctilo","end_time":"1659339900000","start_time":"1659332700000"}},{"id":4,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/CUATRO.png","name":"Cuatro","live_program":{"id":12390,"title":"Bleach","end_time":"1659339900000","start_time":"1659338400000"}},{"id":89,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/ANTV.png","name":"Canal Sur","live_program":{"id":11204,"title":"Evangelion","end_time":"1659340200000","start_time":"1659338700000"}},{"id":68,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/ETB.png","name":"Etb","live_program":{"id":19304,"title":"Pueblos de Bizkaia, Plentzia","end_time":"1659342600000","start_time":"1659335100000"}},{"id":125,"logo":"http://www.movistarplus.es/recorte/m-DP/mux/UBEAT.png","name":"Ubeat","live_program":{"id":39583,"title":"Genesis 22: Smash Ultimate - semifinales","end_time":"1659340500000","start_time":"1659337800000"}}],"currentTime":1659338667990}
    """
    
    let str2 = """
{"id":24677,"cover":"https://imagenes.atresplayer.com/atp/clipping/cmsimages02/2021/09/02/B5277B5E-077F-41BA-8D73-399D2ECF12AC//1280x720.jpg","title":"Espejo Pulico","category":"live","end_time":"1659342600000","start_time":"1659335400000","description":"Espejo Publico es el magacn informativo matinal de Antena3 producido por Antena3 Noticias y presentado por Susanna Griso"}
"""
    
    func getChannelList() -> ChannelListResponse {
        
        if let data = str1.data(using: .utf8) {
            do {
                let response = try JSONDecoder().decode(ChannelListResponse.self, from: data)
                return response
            } catch {
                print("")
            }
        }
        return ChannelListResponse(channels: [], currentTime: 0)
    }
    
    func getChannelDetailInfo() -> LiveProgram {
        if let data = str2.data(using: .utf8) {
            do {
                let response = try JSONDecoder().decode(LiveProgram.self, from: data)
                return response
            } catch {
                print("")
            }
        }
        return LiveProgram(id: 1, title: "as", end_time: "ASDASD", start_time: "asda")
    }
}
