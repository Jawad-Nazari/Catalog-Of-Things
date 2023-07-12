require_relative '../music/music'

describe MusicAlbum do
  subject(:items) do
    [
      MusicAlbum.new(artist: 'Sark', title: 'Mary', genre: 'HipLife', publish_date: '2022-07-12', on_spotify: true)
    ]
  end

  describe '.list_all_music_albums' do
    it 'prints out information about each album in the items array' do
      expect { MusicAlbum.list_all_music_albums(items) }.to output(
        "All Music Albums:\n" \
        "Album ID: #{items[0].id}, Artist Name: Sark, Title: Mary, On Spotify: true, Published Date: 2022-07-12 \n\n"
      ).to_stdout
    end
  end

  describe '.list_all_genres' do
    it 'prints out information about each genre in the items array' do
      expect { MusicAlbum.list_all_genres(items) }.to output(
        "All Genre: \n" \
        "Artist Name: Sark, Genre: HipLife \n\n"
      ).to_stdout
    end
  end

  describe '.add_music_album' do
    it 'adds a new album to the items array and returns the newly created album instance' do
      album = MusicAlbum.add_music_album('Sark', 'Mary', 'HipLife', '2022-07-12', true)
      expect(album).to be_an_instance_of(MusicAlbum)
    end
  end
end
