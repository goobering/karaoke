require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../song.rb'

class TestSong < Minitest::Test

def setup()
    @test_song = Song.new("Title_1", "Artist_1", "Album_1", 1, "Lyrics_1")
end

def test_create_song()
    assert_equal(true, @test_song.is_a?(Song))
end 

def test_get_song_title()
    assert_equal("Title_1", @test_song.title())
end

def test_get_song_artist()
    assert_equal("Artist_1", @test_song.artist())
end

def test_get_song_album()
    assert_equal("Album_1", @test_song.album())
end

def test_get_song_track_num()
    assert_equal(1, @test_song.track_num())
end

def test_get_song_lyrics()
    assert_equal("Lyrics_1", @test_song.lyrics())
end

end