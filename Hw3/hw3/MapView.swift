//
//  MapView.swift
//  hw3
//
//  Created by User02 on 2020/11/1.
//

import SwiftUI
import MapKit //MKMapView

struct MapView: View {
    @Binding var showMap : Bool
    @State private var annotations = [MKPointAnnotation]()
    var name : String
    var latitude : Double
    var longitude : Double
    let themeColor:Color
    var body: some View {
        ZStack {
            mapShow(annotations: annotations).edgesIgnoringSafeArea(.all)
            //地圖地標
            Button(action:{
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                annotation.title = name
                self.annotations.append(annotation)
            }){
                Image(systemName: "chevron.up.circle.fill")
                    .foregroundColor(themeColor)
                    .scaleEffect(2)
                    .position(x:210,y:780)
            }.buttonStyle(PlainButtonStyle())
            //closeBtn
            Button(action: {
                showMap.toggle()
            }){
                Image(systemName: "xmark.circle.fill")
                    .scaleEffect(1.5)
                    .position(x:380,y:0)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

// 將顯示網頁的 WKWebView 包裝成 SwiftUI view
struct mapShow: UIViewRepresentable {
    //加入顯示地圖標記的 MKPointAnnotation
    var annotations = [MKPointAnnotation]()
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
        uiView.showAnnotations(annotations, animated: true)
    }
}
