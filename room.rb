class Room

def initialize(number, capacity, entry_fee)
    @number = number
    @guests = []
    @songs = []
    @capacity = capacity
    @entry_fee = entry_fee
    @balance = 0
end

def number()
    return @number
end

def guests()
    return @guests
end

def songs()
    return @songs
end

def num_guests()
    return @guests.count()
end

def capacity()
    return @capacity
end

def entry_fee()
    return @entry_fee
end

def balance()
    return @balance
end

def add_to_balance(amount)
    @balance += amount
end

def has_capacity_for(guest)
    return num_guests() < capacity()
end

def is_affordable_for(guest)
    return guest.balance() >= entry_fee()
end

def has_favourite_song(guest)
    if songs().count() < 1 
        return false
    else
        song_titles = songs().map { |s| s.title() }
        if guest.favourite_song != nil
            return song_titles.include?(guest.favourite_song())
        end
    end
end

def contains_guest(guest)
    return guest.room_num() == number()
end

def check_in(guest)    
    guest.add_to_balance(entry_fee() * -1)
    add_to_balance(entry_fee)
    @guests.push(guest)
    guest.set_room_num(number())
end

def check_out(guest)    
    @guests.delete(guest)
    guest.set_room_num(nil)
end

def add_song(song)
    @songs.push(song)
end

def remove_song(song)
    @songs.delete(song)
end

end