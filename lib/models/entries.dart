class Entry {
  String entryId;
  String fromMapAddress;
  String toMapAddress;
  String time;
  String date;
  String passengers;
  String luggages;
  String vehicleName;
  String vehicleImage;

  Entry(
      {this.entryId,
      this.fromMapAddress,
      this.toMapAddress,
      this.time,
      this.date,
      this.passengers,
      this.luggages,
      this.vehicleName,
      this.vehicleImage});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        fromMapAddress: json['fromMapAddress'],
        toMapAddress: json['toMapAddress'],
        time: json['time'],
        date: json['date'],
        passengers: json['passengers'],
        luggages: json['luggages'],
        vehicleName: json['vehicleName'],
        vehicleImage: json['vehicleImage'],
        entryId: json['entryId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'fromMapAddress': fromMapAddress,
      'toMapAddress': toMapAddress,
      'time': time,
      'date': date,
      'passengers': passengers,
      'luggages': luggages,
      'vehicleName': vehicleName,
      'vehicleImage': vehicleImage,
      'entryId': entryId
    };
  }
}
