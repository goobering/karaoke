require_relative 'room.rb'
require_relative 'song.rb'
require_relative 'guest.rb'
require_relative 'welcome_viewer.rb'
require_relative 'room_viewer.rb'

class KaraokeBar

def initialize()
    # Initialize rooms
    @rooms = []
    
    @rooms[0] = Room.new(1, 10, 6)
    @rooms[1] = Room.new(2, 11, 7)
    @rooms[2] = Room.new(3, 12, 8)
    @rooms[3] = Room.new(4, 13, 9)
    @rooms[4] = Room.new(5, 14, 10)
    
    # Make sure we have 1 room at capacity
    for i in 0..9 do
        @rooms[0].check_in(Guest.new("First#{i.to_s()}", "Last#{i.to_s()}", (i+1)*20))
    end
    
    # Fill the other rooms with random numbers of guests
    for i in 1..4 do
        random_guest_num = Random.rand(0..10)
        for j in 0..random_guest_num do
            @rooms[i].check_in(Guest.new("First#{random_guest_num.to_s()}", "Last#{random_guest_num.to_s()}", (random_guest_num+1)*20))
        end
    end
    
    # Add songs to rooms
    for i in 0..4 do
        random_song_num = Random.rand(1..10)
        for j in 1..random_song_num do
            @rooms[i].add_song(Song.new("Title_#{j}"))
        end
    end
    
    # Initialize viewers
    @welcome_viewer = WelcomeViewer.new()
    @room_viewer = RoomViewer.new()
    
    @current_guest = nil
end

def run()
    new_guest = run_welcome()
        loop do
        choose_room_value = run_choose_room(new_guest)
        if(choose_room_value == nil)
            break
        else
            # Check room has capacity and guest has sufficient funds
            if !choose_room_value.has_capacity_for(new_guest)
                @welcome_viewer.not_enough_capacity()
                next
            elsif !choose_room_value.is_affordable_for(new_guest)
                @welcome_viewer.not_enough_funds()
                next
            end
            
            # Check in guest
            choose_room_value.check_in(new_guest)
            # Play woohoo if room has favourite song
            if(choose_room_value.has_favourite_song(new_guest))
                @room_viewer.room_has_favourite_song()
            end
        
            loop do
                selected_song = run_room(choose_room_value)
                if(selected_song == nil)
                    choose_room_value.check_out(new_guest)
                    break
                end
            end
        end
    end  
end

def run_welcome()
    # Get mandatory values for guest
    first_name = @welcome_viewer.get_guest_first_name()
    last_name = @welcome_viewer.get_guest_last_name()
    balance = @welcome_viewer.get_guest_balance()
    
    guest = Guest.new(first_name, last_name, balance)
    
    # Get non-mandatory values for guest
    favourite_song = @welcome_viewer.get_guest_favourite_song()
    
    if favourite_song != nil
        guest.set_favourite_song(favourite_song)
    end
    
    return guest
end

def run_choose_room(guest)
    # Choose a room number or exit
    room_choice = @welcome_viewer.room_menu(@rooms)
    # If choose exit:
    if room_choice > @rooms.count()
        return nil
    # If choose a room:
    else
        return @rooms[room_choice - 1]  
    end
end

def run_room(room)
    # Choose a song or exit
    song_choice = @room_viewer.song_menu(room)
    if(song_choice == nil)
        return nil
    end
    return song_choice
end

end