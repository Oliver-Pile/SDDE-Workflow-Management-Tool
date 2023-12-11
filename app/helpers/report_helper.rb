module ReportHelper

  def users_for_cards(cards)
    users = []
    cards.each do |card|
      users << card.users
    end
    users.flatten.uniq.map(&:username)
  end
end
