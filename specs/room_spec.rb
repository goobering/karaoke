require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../room.rb'
require_relative '../guest.rb'
require_relative '../song.rb'

class TestRoom < Minitest::Test

def setup()        
    @test_room = Room.new(1, 5, 20)
    
    @guest_1 = Guest.new("First_0", "Last_0", 20)
    @guest_2 = Guest.new("First_1", "Last_1", 40)
    @guest_3 = Guest.new("First_2", "Last_2", 60)
    @guest_4 = Guest.new("First_3", "Last_3", 80)
    @guest_5 = Guest.new("First_4", "Last_4", 100)
    test_guests = [@guest_1, @guest_2, @guest_3, @guest_4, @guest_5]
    
    for guest in test_guests
        @test_room.check_in(guest)
     end
end

def test_create_room()
    assert_equal(true, @test_room.is_a?(Room))
end

def test_get_room_number()
    assert_equal(1, @test_room.number())
end

def test_get_room_num_guests()
     assert_equal(5, @test_room.num_guests())
end

def test_get_room_guests()
    assert_equal(@guest_1, @test_room.guests[0])
    assert_equal(@guest_2, @test_room.guests[1])
    assert_equal(@guest_3, @test_room.guests[2])
    assert_equal(@guest_4, @test_room.guests[3])
    assert_equal(@guest_5, @test_room.guests[4])
end

def test_add_song_to_room()
    test_song = Song.new("title_0")
    @test_room.add_song(test_song)
    
    assert_equal(test_song, @test_room.songs()[0])
end

def test_remove_song_from_room()
     test_song = Song.new("title_0")
    @test_room.add_song(test_song)
    
    @test_room.remove_song(test_song)
    assert_equal(0, @test_room.songs().count())
end

def test_get_room_songs()
     test_song = Song.new("title_0")
    @test_room.add_song(test_song)
    
    assert_equal(test_song, @test_room.songs()[0])
end

def test_get_room_capacity()
    assert_equal(5, @test_room.capacity())
end

def test_get_room_entry_fee()
    assert_equal(20, @test_room.entry_fee())
end

end