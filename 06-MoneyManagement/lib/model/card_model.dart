class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom) {
    print('color -> $cardBackground');
  }
}

List<CardModel> cards = cardData
    .map(
      (item) => CardModel(
          item['user'],
          item['cardNumber'],
          item['cardExpired'],
          item['cardType'],
          item['cardBackground'],
          item['cardElementTop'],
          item['cardElementBottom']),
    )
    .toList();
List<Map> cardData = [
  {
    'user': 'Amir L',
    'cardNumber': '5047 **** **** ****',
    'cardExpired': '03-01-2023',
    'cardType': 'assets/images/shahr.png',
    'cardBackground': 0xFF1E1E99,
    'cardElementTop': 'assets/icon/ellipse_top_pink.svg',
    'cardElementBottom': 'assets/icon/ellipse_bottom_pink.svg',
  },
  {
    'user': 'Mahdi Pad',
    'cardNumber': '6037 **** **** ****',
    'cardExpired': '03-01-2025',
    'cardType': 'assets/images/mastercard_logo.png',
    'cardBackground': 0xFFFF70A3,
    'cardElementTop': 'assets/icon/ellipse_top_blue.svg',
    'cardElementBottom': 'assets/icon/ellipse_bottom_blue.svg',
  },
  {
    'user': 'hojat gh',
    'cardNumber': '2529 **** **** ****',
    'cardExpired': '03-01-2025',
    'cardType': 'assets/images/shahr.png',
    'cardBackground': 0xFF1E1E99,
    'cardElementTop': 'assets/icon/ellipse_top_pink.svg',
    'cardElementBottom': 'assets/icon/ellipse_bottom_pink.svg',
  },
  {
    'user': 'Ali Motlagh',
    'cardNumber': '2327 **** **** ****',
    'cardExpired': '03-01-2029',
    'cardType': 'assets/images/mastercard_logo.png',
    'cardBackground': 0xFFFF70A3,
    'cardElementTop': 'assets/icon/ellipse_top_blue.svg',
    'cardElementBottom': 'assets/icon/ellipse_bottom_blue.svg',
  },
];
