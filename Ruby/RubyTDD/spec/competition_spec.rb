require_relative "../lib/competition.rb"
require_relative "../lib/team.rb"
require_relative "support/matchers/team_support.rb"

describe Competition do

  let(:competition) {Competition.new}
  let(:team) {Team.new("Team's name")}

  context "having no questions" do
    before { competition.questions = {} }

    it "doesn't accept any teams" do
      #expect do
        #team.enter_competition(competition)
      #end.to raise_error Competition::Closed
        competition.should_not allow_teams_to_enter
    end
  end

  context "having questions" do
    before { competition.questions = [{ :title => "Question" }] }
    subject { competition }

    it { should allow_teams_to_enter }
  end

end
