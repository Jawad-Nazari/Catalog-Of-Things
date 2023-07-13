require_relative '../game_handler'

describe GameHandler do
    let(:game_handler) { Class.new { include GameHandler }.new }
    subject { game_handler }
  
    describe '#list_all_games' do
  
      it 'displays the list of games' do
        expect(Game).to receive(:display_games).with(subject.instance_variable_get(:@items))
        expect { subject.list_all_games }.to output(/List of games:/).to_stdout
      end
    end
  
    describe '#list_all_authors' do
  
      it 'displays the list of authors' do
        expect(Game).to receive(:list_all_authors).with(subject.instance_variable_get(:@items))
        expect { subject.list_all_authors }.to output(/List of authors:/).to_stdout
      end
    end
  
    describe '#add_game' do
  
      before do
        allow(subject).to receive(:gets).and_return('Game Name', 'Author Name', 'true', '2023-07-13')
        allow(Date).to receive(:parse).with('2023-07-13').and_return(Date.new(2023, 7, 13))
      end
  
      it 'adds a game and saves it to JSON' do
        expect(Game).to receive(:new).with(true, Date.new(2023, 7, 13), 'Author Name', 'Game Name')
        expect(subject.instance_variable_get(:@items)).to receive(:<<)
        expect(subject).to receive(:save_games_to_json)
  
        expect { subject.add_game }.to output(/Game added successfully!/).to_stdout
      end
    end
  end