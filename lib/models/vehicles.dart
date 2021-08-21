class Vehicle {
  final String id;
  final String name;
  final String passengers;
  final String luggage;
  final num price;
  final String image;

  Vehicle(
      {this.id,
      this.name,
      this.passengers,
      this.luggage,
      this.price,
      this.image});
}

final vehicles = [
  Vehicle(
    id: "01",
    name: "Saloon",
    passengers: "3",
    luggage: "3",
    price: 10,
    image: "assets/images/car1.jpg",
  ),
  Vehicle(
    id: "02",
    name: "MPV",
    passengers: "5",
    luggage: "3",
    price: 15,
    image: "assets/images/car2.jpg",
  ),
  Vehicle(
    id: "03",
    name: "Estate",
    passengers: "3",
    luggage: "2",
    price: 18,
    image: "assets/images/car3.jpg",
  ),
];
