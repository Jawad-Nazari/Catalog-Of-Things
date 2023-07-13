require_relative '../game_handler'

describe GameHandler do
  let(:game_handler) { GameHandler.new }

  it 'can list all games' do
    mock_game = double('Game', title: 'The Legend of Zelda', author: 'Shigeru Miyamoto', multiplayer: true,
                               last_played_at: Date.today)
    allow(game_handler).to receive(:add_game).and_return(mock_game)

    game_handler.add_game('The Legend of Zelda', 'Shigeru Miyamoto', true, Date.today)

    expected_games = [mock_game]

    expect(game_handler.list_all_games).to eq(expected_games)
  end

  it 'can add a game' do
    mock_game = double('Game', title: 'The Legend of Zelda', author: 'Shigeru Miyamoto', multiplayer: true,
                               last_played_at: Date.today)
    allow(game_handler).to receive(:add_game).and_return(mock_game)

    expect(game_handler.add_game).to eq(mock_game)
  end

  it 'can list all authors' do
    mock_game = double('Game', title: 'The Legend of Zelda', author: 'Shigeru Miyamoto', multiplayer: true,
                               last_played_at: Date.today)
    mock_game2 = double('Game', title: 'Super Mario Bros.', author: 'Shigeru Miyamoto', multiplayer: false,
                                last_played_at: Date.today)
    allow(game_handler).to receive(:add_game).and_return(mock_game, mock_game2)

    expected_authors = ['Shigeru Miyamoto']

    expect(game_handler.list_all_authors).to eq(expected_authors)
  end
end
