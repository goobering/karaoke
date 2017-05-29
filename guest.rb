class Guest

def initialize(first_name, last_name, balance)
    @first_name = first_name
    @last_name = last_name
    @room_num = nil
    @balance = balance
    @favourite_song = ""
end

def first_name()
    return @first_name
end

def last_name()
    return @last_name
end

def room_num()
    return @room_num
end

def balance()
    return @balance
end

def favourite_song()
    return @favourite_song
end

def set_favourite_song(favourite_song)
    @favourite_song = favourite_song
end

def set_room_num(number)
    @room_num = number
end

def add_to_balance(amount)
    @balance += amount
end

end