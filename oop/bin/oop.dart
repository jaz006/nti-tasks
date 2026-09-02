
import 'dart:io';

//showing seats
void ShowSeats(List<List<String>> seats) {
  print("Theater Seats:");

  for (int i = 0; i < seats.length; i++) {
    for (int j = 0; j < seats[i].length; j++) {
      stdout.write("${seats[i][j]} ");
    }
    print('');
  }
}

//book function
void bookSeat(
  List<List<String>> seats,
  Map<String, Map<String, String>> bookings,
) 

   /// "2,3": {"name": "Ahmed", "phone": "0100000000"},
   // "1,1": {"name": "Sara", "phone": "0111111111"},
  
{
  print("Enter row (1-5) or 'exit' to quit: ");
  String? rowInput = stdin.readLineSync();

  if (rowInput == 'exit') {
    return;
  }

  int row = int.parse(rowInput!) - 1;

  if (row < 0 || row >= 5) {
    print("Invalid row!");
    return;
  }

  stdout.write("Enter column (1-5): ");
  String? columnInput = stdin.readLineSync();

  int column = int.parse(columnInput!) - 1;

  if (column < 0 || column >= 5) {
    print("Invalid column!");
    return;
  }

  if (seats[row][column] == 'B') {
    print("Sorry, this seat is already booked!");
    return;
  }

  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter your phone number: ");
  String phone = stdin.readLineSync()!;

  // نغير حالة الكرسي إلى Booked
  seats[row][column] = 'B';

  // نحول الـ index مرة تانية لأرقام المستخدم
  String seatPosition = "${row + 1},${column + 1}";

  bookings[seatPosition] = {
    "name": name,
    "phone": phone,
  };

  print("Seat booked successfully!");
}

//show user data
void showUsersData(Map<String, Map<String, String>> bookings) {
  print("\nUsers Booking Details:");

  bookings.forEach((seat, user) {
    print("Seat $seat: ${user["name"]} - ${user["phone"]}");
  });
}



//main
void main() {
  List<List<String>> seats = List.generate(
    5,
    (index) => List.filled(5, 'E'),
  );

  Map<String, Map<String, String>> bookings = {};

  while (true) {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      bookSeat(seats, bookings);
    } else if (choice == '2') {
      ShowSeats(seats);
    } else if (choice == '3') {
      showUsersData(bookings);
    } else if (choice == '4') {
      print("See You Back");
      break;
    }
  }
}
