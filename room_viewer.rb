require_relative 'song.rb'

class RoomViewer

def room_has_favourite_song()
    print("D\r")
    sleep(0.4)
    print("DI\r")
    sleep(0.4)
    print("DIS\r")
    sleep(0.4)
    print("DISC\r")
    sleep(0.4)
    print("DISCO\r")
    sleep(0.4)
    
    # Buggered if I know why this doesn't work - first never evaluates to 'D', until loop never breaks: 
    # first = nil
    # until (first == 'D') do
        # for c in 'A'..'Z' do
            # first = c
            # print "#{c}\r"
            # sleep(0.05)
        # end
    # end
end

def song_menu(room)
    songs = room.songs()
    song_titles = songs.map { |r| r.title }
    selected_song = nil
    response = nil
    until (song_titles.include?(selected_song) && response >= 0) do
        puts "Please select a song number or exit the room: "
        for i in 0..song_titles.count()-1 do
            puts "#{i+1}: #{song_titles[i]}"
        end
        puts "#{song_titles.count() + 1}: Leave the room."
        print "> "
        response = gets.chomp()
        if response.to_i() == song_titles.count() + 1
            return nil
        end
        response = response.to_i() - 1
        selected_song = song_titles[response]
    end
    return selected_song
end

end