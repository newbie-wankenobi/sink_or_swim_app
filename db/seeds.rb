Circuit.delete_all
SwimSession.delete_all
User.delete_all

tony = User.create(
  height:      71.0,
  weight:      200.0,
  born_on:     Date.parse("28-12-1967"),
  gender:      "male",
  email:       "tony@gmail.com",
  first_name:  "Tony",
  last_name:   "Exampleman",
  password:    "123",
  password_confirmation: "123"
)

todays_session = tony.swim_sessions.create(
  location:     "Studio 77",
  pool_length:  12,
  date:         Date.today,
  minutes_long: 20
)

todays_session.circuits.create(
  stroke:   "front-crawl",
  num_laps: 30
)

todays_session.circuits.create(
  stroke:   "backstroke",
  num_laps: 5
)
