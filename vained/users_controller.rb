class UsersController < ApplicationController
  def index
    @users = [
    User.new(
      id: 1,
      name: "Vahan",
      username: "Gegardus",
      avatar_url: "https://preview.redd.it/hayk-patriarch-by-rubik-kocharian-2008-v0-wn8cqwk0h3981.jpg?width=640&crop=smart&auto=webp&s=d99c8e70db3ecedbc23da43ce2fa250b6a8e51d8"
    ),
    User.new(
      id: 2,
      name: "Ani",
      username: "Dicuhi"
    )
  ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: "Vahan",
      username: "Gegardus",
      avatar_url: "https://preview.redd.it/hayk-patriarch-by-rubik-kocharian-2008-v0-wn8cqwk0h3981.jpg?width=640&crop=smart&auto=webp&s=d99c8e70db3ecedbc23da43ce2fa250b6a8e51d8"
    )

    @questions = [
      Question.new(text: "How do you do?", created_at: Date.parse("27.03.2025")),
      Question.new(text: "What is moral of life?", created_at: Date.parse("27.03.2025"))
    ]

    @new_question = Question.new
  end
end
