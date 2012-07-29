Talk.destroy_all
10.times do |index|
  Talk.create title: "Talk Number #{index}", vote_count: rand(10)
end
