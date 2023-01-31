10.times do
    user = User.create!(
        last_name: Faker::Name.last_name,
        first_name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        password: 'foobar',
        password_confirmation: 'foobar',
    )
end

20.times do
    board = Board.create!(
        title: Faker::Books::CultureSeries.book,
        body: Faker::Quote.famous_last_words,
        user_id: User.offset(rand(User.count)).first
    )
end