Talk.destroy_all
10.times do |index|
  attributes = {title: "Talk Number #{index}", vote_count: rand(10)}
  Talk.create attributes, :as => :seed
end
