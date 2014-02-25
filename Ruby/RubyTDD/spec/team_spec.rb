require_relative "../lib/team.rb"

describe Team do
  it "has a name" do
    Team.new("Team's name").should respond_to :name
  end
  it "has a list of players" do
    Team.new("Team's name").players.should be_kind_of Array
  end

  it "is favored if it has a celebrity in it" do
    Team.new("Team's name", ["George Clooney", "Miguel Lopez"]).should be_favored
  end

  it "complains if there is a bad word in the name" do
    expect { Team.new("Crappy team name")  }.to raise_error
  end

  context "given a bad list of players" do
    let(:bad_players) { {} }

    it "fails to create" do
      expect { Team.new("Team's name", bad_players)  }.to raise_error
    end

  end


end

