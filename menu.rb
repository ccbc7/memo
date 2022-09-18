require 'csv'

puts "メモアプリ"
puts "----------------------"





  def create
    puts "拡張子を除いたファイル名を入力してください。"
    fileName = gets.chomp
    "----------------------"
    puts "メモを入力してください。(control + D で登録)"
    puts "----------------------"
    memoes = gets("\x04").chomp("\x04")
    puts "----------------------"
    CSV.open("#{fileName}.csv", 'w') do |push|
      push << ["#{memoes}"]
    end
    puts "登録が完了しました。"
  end

  def postscript
    puts "メモを編集します。"
    puts "拡張子を除いたファイル名を入力してください。"
    fileName = gets.chomp
    data_list = CSV.read("#{fileName}.csv")
    puts data_list
    puts "----------------------"
    puts "追記する内容を入力してください。(control + D で登録)"
    memoes = gets("\x04").chomp("\x04")
    puts "----------------------"
    CSV.open("#{fileName}.csv", 'a') do |push|
      push << ["#{memoes}"]
    end
    puts "追記が完了しました。"
  end





while true do
  puts "1・・・メモを登録する"
  puts "2・・・メモを編集する"
  puts "9・・・終了"
  puts "番号を選択してください"
  puts "----------------------"
  num = gets.chomp.to_i
  if num == 1
    create
  elsif num == 2
    postscript
  elsif num == 9
    break
  else
    puts "半角で数字を入力してください。"
  end
end







#  キーボードから入力した値をCSVファイルに書き出すことができる。
#  ユーザーが1を入力した場合、新規ファイルを作成する。
#  ユーザーが2を入力した場合、既存のファイルを編集する。
