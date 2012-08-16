objective_titles = [
  "Black Friday Promotions",
  "Gift Registry - Expecting Parents",
  "Cart Sync - Increase AOV (average order value)",
  "Wishlist",
  "Customer Loyalty - Mobile Coupon",
  "Geofencing - Exit Survey",
  "Geofencing - In Store Promotions",
  "Geofencing - Ask for Help",
  "Geofencing - Price Check"
]

project_titles = [
  "Android",
  "iOS",
  "Mobile Web",
  "Web",
  "POS"
]

programs = ['Online Retail', 'Point of Sale']

programs.each { |title| Program.create(title: title) }

(1..2).each { |i| Plan.create(title: "Great Plan #{i}", program_id: i) }

generated_project_titles = (1..12).map {|i| "#{project_titles[(rand(project_titles.length))]} #{i}" }
(1..4).each { |i| Project.create(title: generated_project_titles[i - 1], plan_id: 1) }
(5..8).each { |i| Project.create(title: generated_project_titles[i - 1], plan_id: 2) }

(1..10).each { |i| Objective.create(title: "#{objective_titles[(rand(objective_titles.length))]} #{i}", program_id: 1, plan_id: 1, cost: rand(1..10).to_i, value: rand(1..10).to_i) }
