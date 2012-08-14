(1..3).each { |i| Program.create(title: "Program of Work #{i}") }

(1..3).each { |i| Plan.create(title: "Great Plan #{i}", program_id: i) }

(1..4).each { |i| Project.create(title: "Project #{i}", plan_id: 1) }
(5..8).each { |i| Project.create(title: "Project #{i}", plan_id: 2) }
(9..12).each { |i| Project.create(title: "Project #{i}", plan_id: 3) }

(1..10).each { |i| Objective.create(title: "Objective #{i}", program_id: Program.first.id, plan_id: Plan.first.id, cost: rand(10), value: rand(10)) }
