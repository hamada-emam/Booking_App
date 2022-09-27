abstract class BookingStates {}

class InitBookingState extends BookingStates {}

class SuccessGetBookingsState extends BookingStates {}

class FailedGetBookingsState extends BookingStates {}

class LoadingGetBookingsState extends BookingStates {}

class SuccessCreateBookingState extends BookingStates {}

class FailedCreateBookingState extends BookingStates {}

class SuccessUpdateBookingState extends BookingStates {}

class FailedUpdateBookingState extends BookingStates {}
