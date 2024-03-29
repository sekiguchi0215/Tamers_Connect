# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?

puts "管理ユーザーの初期データの投入に成功しました。"

User.create!(
  [
    {
      nickname: "ゲストユーザー",
      introduction: "ゲストユーザー",
      email: "guest@example.com",
      password: SecureRandom.urlsafe_base64,
    },
    {
      nickname: "大知",
      introduction: "よろしく。",
      email: "taichi@example.com",
      password: password,
    },
    {
      nickname: "大祐",
      introduction: "よろしくお願いします。",
      email: "daisuke@example.com",
      password: password,
    },
    {
      nickname: "隆人",
      introduction: "練習相手募集中！",
      email: "takato@example.com",
      password: password,
    },
    {
      nickname: "卓矢",
      introduction: "DC-1グランプリ予選突破！",
      email: "takuya@example.com",
      password: password,
    },

  ]
)

puts "ユーザーの初期データの投入に成功しました。"

DeckList.create!(
  [
    {
      user_id: 1,
      deck_list: File.open("public/images/bondbluehybrid.jpg"),
      status: "public",
      content: "青絆ハイブリッド\r\n奥深い",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/violetagro.jpg"),
      status: "public",
      content: "紫アグロ\r\nオーガ",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/redhybrid.jpg"),
      status: "public",
      content: "赤ハイブリッド",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/armorpail.jpg"),
      status: "public",
      content: "パイル",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/blackwargreymon.jpg"),
      status: "public",
      content: "黒ブラウォ\r\n難しい",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/x-antibody.jpg"),
      status: "public",
      content: "X抗体\r\nアルファモン",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/yellowhybrid.jpg"),
      status: "public",
      content: "黄ハイ\r\nシャイン",
    },
    {
      user_id: 1,
      deck_list: File.open("public/images/lilithzwart.jpg"),
      status: "public",
      content: "リリズワ",
    },
    {
      user_id: 2,
      deck_list: File.open("public/images/machinedramon.jpg"),
      status: "public",
      content: "ムゲンネイル\r\nむずかしい",
    },
    {
      user_id: 3,
      deck_list: File.open("public/images/bluehybrid.jpg"),
      status: "public",
      content: "青ハイ\r\nエボカ優勝",
    },
    {
      user_id: 3,
      deck_list: File.open("public/images/jesmon.jpg"),
      status: "public",
      content: "ジエス\r\nキメラ入り",
    },

    {
      user_id: 5,
      deck_list: File.open("public/images/armoragro.jpg"),
      status: "public",
      content: "アーマー",
    },
    {
      user_id: 5,
      deck_list: File.open("public/images/green.jpg"),
      status: "public",
      content: "シーヴァモン\r\n奥深い",
    },
  ]
)

puts "デッキリストの初期データの投入に成功しました。"

Recruitment.create!(
  [
    {
      user_id: 1,
      number_of_applicants: "two",
      event_title: "第3回ファイル島杯",
      recruitment_condition: "enjoy",
      introduction: "第4回テスト杯開催希望。",
    },
    {
      user_id: 1,
      number_of_applicants: "one",
      event_title: "第5回クラウド大陸杯",
      recruitment_condition: "enjoy",
      introduction: "１名のみの募集ですが、よろしくお願いします！",
    },
    {
      user_id: 1,
      number_of_applicants: "two",
      event_title: "第1回ファーガ杯",
      recruitment_condition: "seriousness",
      introduction: "勝ちに行きたいです。\r\nリモート等で練習できる方よろしくお願いします！",
    },
    {
      user_id: 1,
      number_of_applicants: "two",
      event_title: "スパイラルマウンテン杯",
      recruitment_condition: "anyone",
      introduction: "どなたでも歓迎です！",
    },
    {
      user_id: 2,
      number_of_applicants: "one",
      event_title: "第3回ファイル島杯",
      recruitment_condition: "anyone",
      introduction: "誰でも歓迎です！",
    },
    {
      user_id: 2,
      number_of_applicants: "two",
      event_title: "第5回クラウド大陸杯",
      recruitment_condition: "anyone",
      introduction: "誰でも歓迎です！",
    },
    {
      user_id: 2,
      number_of_applicants: "two",
      event_title: "第1回ファーガ杯",
      recruitment_condition: "anyone",
      introduction: "誰でも歓迎です！",
    },
    {
      user_id: 2,
      number_of_applicants: "two",
      event_title: "スパイラルマウンテン杯",
      recruitment_condition: "anyone",
      introduction: "誰でも歓迎です！",
    },
    {
      user_id: 3,
      number_of_applicants: "one",
      event_title: "第3回ファイル島杯",
      recruitment_condition: "seriousness",
      introduction: "強者求む",
    },
    {
      user_id: 4,
      number_of_applicants: "two",
      event_title: "第3回ファイル島杯",
      recruitment_condition: "enjoy",
      introduction: "初心者ですが、よろしくお願いします。",
    },
  ]
)

puts "メンバー募集の初期データの投入に成功しました。"

Entry.create!(
  [
    {
      user_id: 2,
      recruitment_id: 1,
    },
    {
      user_id: 3,
      recruitment_id: 1,
    },
    {
      user_id: 4,
      recruitment_id: 1,
    },
    {
      user_id: 2,
      recruitment_id: 9,
    },
    {
      user_id: 4,
      recruitment_id: 2,
    },
  ]
)

puts "応募の初期データの投入に成功しました。"

Room.create!
Room.create!

puts "ルームの初期データの投入に成功しました。"

RoomKey.create!(
  [
    {
      room_id: 1,
      user_id: 1,
    },
    {
      room_id: 1,
      user_id: 2,
    },
    {
      room_id: 2,
      user_id: 1,
    },
    {
      room_id: 2,
      user_id: 4,
    },
  ]
)

puts "ルームキーの初期データの投入に成功しました。"

DirectMessage.create!(
  [
    {
      user_id: 1,
      room_id: 1,
      message: "優勝しました！",
    },
    {
      user_id: 2,
      room_id: 1,
      message: "おめでとうございます！",
    },
    {
      user_id: 4,
      room_id: 2,
      message: "はじめまして。",
    },
  ]
)

puts "ダイレクトメッセージの初期データの投入に成功しました。"

Team.create!
Team.create!
Team.create!

puts "チームの初期データの投入に成功しました。"

Member.create!(
  [
    {
      user_id: 1,
      team_id: 1,
    },
    {
      user_id: 2,
      team_id: 1,
    },
    {
      user_id: 3,
      team_id: 1,
    },
    {
      user_id: 4,
      team_id: 2,
    },
    {
      user_id: 1,
      team_id: 2,
    },
    {
      user_id: 3,
      team_id: 3,
    },
  ]
)

puts "メンバーの初期データの投入に成功しました。"

TeamMessage.create!(
  [
    {
      team_id: 1,
      user_id: 2,
      message: "リモートで練習しませんか？",
    },
    {
      team_id: 1,
      user_id: 1,
      message: "9時頃ならいけます！",
    },
    {
      team_id: 1,
      user_id: 3,
      message: "自分も９時頃ならいけそうです！",
    },
    {
      team_id: 1,
      user_id: 2,
      message: "了解です！",
    },
    {
      team_id: 2,
      user_id: 1,
      message: "招待ありがとうございます。",
    },
    {
      team_id: 2,
      user_id: 1,
      message: "よろしくお願いします！",
    },
  ]
)

puts "チームメッセージの初期データの投入に成功しました。"

Notification.create!(
  [
    {
      visitor_id: 2,
      visited_id: 1,
      recruitment_id: 1,
      action: "entry",
    },
    {
      visitor_id: 2,
      visited_id: 1,
      room_id: 1,
      action: "direct_message",
    },
    {
      visitor_id: 3,
      visited_id: 1,
      team_id: 1,
      action: "team_message",
    },
    {
      visitor_id: 3,
      visited_id: 1,
      team_id: 3,
      action: "invitation",
    },
  ]
)

puts "通知の初期データの投入に成功しました。"
