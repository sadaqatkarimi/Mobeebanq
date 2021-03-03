import 'package:flutter/material.dart';


class itemDetail{

  String name;
  String address;
  String price;
  String iconss;
  String time;


  itemDetail({
    this.name,
    this.address,
    this.price,
    this.iconss,
    this.time
  });
}

List PaymentList = [

  itemDetail(
      name:"Cafe Billy's Bakery",
      address: "75 Franklin St. New York, Ny 100013, USA",
      price: "10.95",
      iconss: "icons/cup.png",
    time: "11:42"
  ),
  itemDetail(
      name:"Cafe MoMA Store",
      address: "75 Franklin St. New York, Ny 100013, USA",
      price: "122",
      iconss: "icons/shop.png",
    time: "13:10"
  ),
  itemDetail(
      name:"Pet beauty saloon",
      address: "75 Franklin St. New York, Ny 100013, USA",
      price: "52.39",
      iconss: "icons/pet.png",
    time: "13:09"
  ),

  itemDetail(
      name:"withDraw funds",
      address: "75 Franklin St. New York, Ny 100013, USA",
      price: "100",
      iconss: "icons/withdraw.png",
    time: "10:20"
  ),
  itemDetail(
      name:"Food of love bakery",
      address: "75 Franklin St. New York, Ny 100013, USA",
      price: "52.87",
      iconss: "icons/foodlove.png",
    time: "09:42"
  ),
];
