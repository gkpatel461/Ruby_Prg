class Poker
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  CARDS2 = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  HAND_TYPES = %w(high_of one_pair double_pair three_of_a_kind straight flush full_house four_of_a_kind straight_flush)

  def initialize(hands)
    @hands = hands.map { |hand| hand_type(hand) }
  end

  def best_hand
    h_type = highest_hand_type
    results = @hands.select { |hand| hand[:type] == h_type }
    max_result = results.max_by { |hand| hand[:result] }[:result]

    results.reject { |hand| hand[:result] != max_result }
           .map { |hand| hand[:hand] }
  end

  private

  def hand_type(hand)
    filtered_hand = filter_card_type(hand)

    processed_hand = {
      type: nil,
      hand: hand,
      result: nil
    }

    if (processed_hand[:result] = straight(filtered_hand)) && flush(hand)
      processed_hand[:type] = 'straight_flush'
    elsif (processed_hand[:result] = four_of_a_kind(filtered_hand))
      processed_hand[:type] = 'four_of_a_kind'
    elsif (processed_hand[:result] = full_house(filtered_hand))
      processed_hand[:type] = 'full_house'
    elsif (processed_hand[:result] = flush(hand))
      processed_hand[:type] = 'flush'
    elsif (processed_hand[:result] = straight(filtered_hand))
      processed_hand[:type] = 'straight'
    elsif (processed_hand[:result] = three_of_a_kind(filtered_hand))
      processed_hand[:type] = 'three_of_a_kind'
    elsif (processed_hand[:result] = double_pair(filtered_hand))
      processed_hand[:type] = 'double_pair'
    elsif (processed_hand[:result] = one_pair(filtered_hand))
      processed_hand[:type] = 'one_pair'
    else
      processed_hand[:type] = 'high_of'
      processed_hand[:result] = high_of(filtered_hand)
    end

    processed_hand
  end

  def filter_card_type(hand)
    hand.map { |card| card[0] }
  end

  def cards_to_index(hand, cards=CARDS)
    hand.map { |card| cards.index(card) }
  end

  def highest_hand_type
    HAND_TYPES[@hands.map { |hand| HAND_TYPES.index(hand[:type])}.max]
  end

  def high_of(hand)
    cards_to_index(hand).max
  end

  def flush(hand)
    kinds = hand.map { |card| card[1] }.uniq
    return nil if kinds.length > 1
    high_of(filter_card_type(hand))
  end

  def straight_with_card_set(hand, cards)
    hand = cards_to_index(hand, cards).sort
    prev = hand.first
    (1..4).to_a.each { |index| return nil if hand[index] - prev != 1; prev = hand[index] }
    hand.last
  end

  def straight(hand)
    if(result = straight_with_card_set(hand, CARDS2))
      result - 1
    else
      straight_with_card_set(hand, CARDS)
    end
  end

  def full_house(hand)
    return nil unless three_of_a_kind(hand) && one_pair(hand)
    three_of_a_kind(hand) + one_pair(hand)
  end

  def duplicats(hand, count)
    hand = cards_to_index(hand)
    hand.reject { |card| hand.count(card) != count }
  end

  def four_of_a_kind(hand)
    pairs = duplicats(hand, 4)
    return nil unless pairs.length == 4
    pairs
  end

  def three_of_a_kind(hand)
    pairs = duplicats(hand, 3)
    return nil unless pairs.length == 3
    pairs
  end

  def double_pair(hand)
    pairs = duplicats(hand, 2)
    return nil unless pairs.length == 4
    pairs.sort.reverse
  end

  def one_pair(hand)
    pairs = duplicats(hand, 2)
    return nil unless pairs.length == 2
    pairs
  end
end

class BookKeeping
  VERSION = 1
end
