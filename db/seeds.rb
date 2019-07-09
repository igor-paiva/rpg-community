if Rails.env.development?
  joao = User.find_by(
    name: 'João',
    email: 'joao@mail.com'
  )

  jose = User.find_by(
    name: 'José',
    email: 'jose@mail.com'
  )

  jorge = User.find_by(
    name: 'Jorge',
    email: 'jorge@mail.com'
  )

  john = User.find_by(
    name: 'john',
    email: 'john@mail.com'
  )

  user1 = joao || User.create!(
    name: 'João',
    email: 'joao@mail.com',
    phone: '999182031',
    twitter: '@joaozera',
    instagram: '@joaozera',
    password: 'joao12',
    password_confirmation: 'joao12'
  )

  user2 = jose || User.create!(
    name: 'José',
    email: 'jose@mail.com',
    password: 'jose12',
    phone: '192730112',
    password_confirmation: 'jose12',
    description: Faker::Lorem.paragraph_by_chars
  )

  user3 = jorge || User.create!(
    name: 'Jorge',
    email: 'jorge@mail.com',
    password: 'jorge12',
    phone: '182399230',
    twitter: '@jorgin',
    instagram: '@jorgin',
    password_confirmation: 'jorge12',
    description: Faker::Lorem.paragraph_by_chars
  )

  user4 = john || User.create!(
    name: 'John',
    email: 'john@mail.com',
    phone: '9754901203',
    twitter: '@johners',
    instagram: '@johners',
    password: 'john12',
    password_confirmation: 'john12'
  )

  player_joao = Player.find_by(
    user_id: user1.id,
  )

  player_jose = Player.find_by(
    user_id: user2.id,
  )

  player_jorge = Player.find_by(
    user_id: user3.id,
  )

  player_john = Player.find_by(
    user_id: user4.id,
  )

  master_joao = Master.find_by(
    user_id: user1.id,
  )

  master_jose = Master.find_by(
    user_id: user2.id,
  )

  master_jorge = Master.find_by(
    user_id: user3.id,
  )

  master_john = Master.find_by(
    user_id: user4.id,
  )

  player1 = player_joao || Player.create!(
    user_id: user1.id,
    campaigns: 4,
  )

  player2 = player_jose || Player.create!(
    user_id: user2.id,
    campaigns: 5,
  )

  player3 = player_jorge || Player.create!(
    user_id: user3.id,
    campaigns: 6,
  )

  player4 = player_john || Player.create!(
    user_id: user4.id,
    campaigns: 7,
  )

  master1 = master_joao || Master.create!(
    user_id: user1.id,
    campaigns: 1,
  )

  master2 = master_jose || Master.create!(
    user_id: user2.id,
    campaigns: 2,
  )

  master3 = master_jorge || Master.create!(
    user_id: user3.id,
    campaigns: 3,
  )

  master4 = master_john || Master.create!(
    user_id: user4.id,
    campaigns: 4,
  )

  table_joao = Table.find_by(
    admin_id: user1.id,
    name: 'Mesa do user 1',
    max_players: 5,
  )

  table_jose = Table.find_by(
    admin_id: user2.id,
    name: 'Mesa do user 1',
    max_players: 5,
  )

  table_jorge = Table.find_by(
    admin_id: user3.id,
    name: 'Mesa do user 1',
    max_players: 5,
  )

  table1 = table_joao || Table.create!(
    admin_id: user1.id,
    name: 'Mesa do user 1',
    max_players: 5,
    description: Faker::Lorem.paragraph_by_chars
  )

  table2 = table_jose || Table.create!(
    admin_id: user2.id,
    name: 'Mesa do user 2',
    max_players: 4,
    description: Faker::Lorem.paragraph_by_chars
  )

  table3 = table_jorge || Table.create!(
    admin_id: user3.id,
    name: 'Mesa do user 3',
    max_players: 4,
    description: Faker::Lorem.paragraph_by_chars
  )

  player_table_jose = PlayerTable.find_by(
    player_id: player2.id,
    table_id: table1.id
  )

  player_table_jorge = PlayerTable.find_by(
    player_id: player3.id,
    table_id: table1.id
  )

  player_table_john = PlayerTable.find_by(
    player_id: player4.id,
    table_id: table1.id
  )

  player_table1 = player_table_jose || PlayerTable.create!(
    player_id: player2.id,
    table_id: table1.id
  )

  player_table2 = player_table_jorge || PlayerTable.create!(
    player_id: player3.id,
    table_id: table1.id
  )

  player_table3 = player_table_john || PlayerTable.create!(
    player_id: player4.id,
    table_id: table1.id
  )

  table1_master_table = MasterTable.find_by(
    master_id: master3.id,
    table_id: table1.id
  )

  master_table = table1_master_table || MasterTable.create!(
    master_id: master3.id,
    table_id: table1.id
  )
end
