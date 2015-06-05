require "spec_helper"

describe Lita::Handlers::Genius, lita_handler: true do

  it { is_expected.to route_command("genius weeknd montreal").to(:search) }

  describe "#search" do

    it "returns the top result for a search query" do
      send_command "genius runnin through the 6 with my woes"
      expect(replies.count).to eq 2
      expect(replies.first).to match(/aphorism/)
      expect(replies.last).to match(/^Drake - Know Yourself \| http:\/\/genius\.com\/songs\/703654/)
      expect(replies.first).not_to include("\n")
    end

    it "returns an appropriate message when there are no search results" do
      send_command "genius aklsjklawjekj"
      expect(replies.count).to eq 1
      expect(replies.first).to match(/^No songs found for 'aklsjklawjekj'$/)
    end

  end

end
