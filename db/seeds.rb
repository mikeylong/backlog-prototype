programs  = Program.create(title: "Program of Work")
backlogs  = Backlog.create(title: "Common Backlog", program_id: Program.first.id)
plans     = Plan.create(title: "Plan", program_id: Program.first.id)
projects  = Project.create(title: "Team 1", plan_id: Plan.first.id)# ,
#             Project.create(title: "Team 2", plan_id: plans.first),
#             Project.create(title: "Team 3", plan_id: plans.first)
objectives= Objective.create(title: "Foster a development community with API", backlog_id: Backlog.first.id)# ,
#             Objective.create(title: "User growth with email integrations", backlog_id: backlogs.first),
#             Objective.create(title: "Retain customers with favorites", backlog_id: backlogs.first),
#             Objective.create(title: "User growth with address book import", backlog_id: backlogs.first)
