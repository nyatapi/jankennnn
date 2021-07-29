
puts "じゃんけ---ん"
class Player
  def hand
    puts "数字を入力してください。\n0:グー\n1:チョキ\n2:パー"
    STDOUT.flush
    player_hand = gets
    return player_hand
  end
end

class Enemy
  def hand
    random = Random.new()
    enemy_hand = random.rand(3)
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    pattern = ["グー","チョキ","パー"]
    if player_hand !="0\n" && player_hand !="1\n" && player_hand !="2\n"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    else
      while true
        player_hand = player_hand.to_i
        result = (player_hand - enemy_hand + 3) % 3
        if result == 0
          puts "自分の手は#{pattern[player_hand]}、相手の手も#{pattern[enemy_hand]}です。"#
          puts "あいこで・・・"
          player = Player.new
          enemy = Enemy.new
          janken = Janken.new
          janken.pon(player.hand, enemy.hand)
          return true
        elsif result == 2
          puts "自分の手は#{pattern[player_hand]}、相手の手は#{pattern[enemy_hand]}です。あなたのwinnerです。(^ ^)"
          return false
        elsif result == 1
          puts "自分の手は#{pattern[player_hand]}、相手の手は#{pattern[enemy_hand]}です。相手のwinnerです。(T T)"
          return false
        end
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
janken.pon(player.hand, enemy.hand)
