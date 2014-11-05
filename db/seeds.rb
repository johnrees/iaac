maa = Course.create!({name: 'MAA', description: 'Masters'}) #8 ECTS credits

course = Course.create!({name: 'IS.1 Introduction Studio', description: 'Torre Barro - Energy District', parent: maa}) #8 ECTS credits

group = Course.create!({name: 'Group 1', description: 'desc', parent: course})
user = User.create!({first_name: 'Claudia', last_name: 'Pasquero'})
user.add_role :tutor, group
user = User.create!({first_name: 'Carmelo', last_name: 'Zappula'})
user.add_role :tutor, group

group = Course.create!({name: 'Group 2', description: 'desc', parent: course})
user = User.create!({first_name: 'Edouard', last_name: 'Cabay'})
user.add_role :tutor, group
user = User.create!({first_name: 'Rodrigo', last_name: 'Aguirre'})
user.add_role :tutor, group

group = Course.create!({name: 'IC.1 Seminar', description: 'Digital Fabrication', parent: maa})
user = User.create!({first_name: 'Alexander', last_name: 'Dubor'})
user.add_role :tutor, group
user = User.create!({first_name: 'Sofokilis', last_name: 'Giannakopoulos'})
user.add_role :tutor, group
user = User.create!({first_name: 'Anna', last_name: 'Popova'})
user.add_role :tutor, group

group = Course.create!({name: 'IC.2 Seminar', description: 'Economics of Sustainability', parent: maa})
user = User.create!({first_name: 'Gonzalo', last_name: 'Delacamara'})
user.add_role :tutor, group

group = Course.create!({name: 'IC.3 Seminar', description: 'Advanced Architecture Concepts', parent: maa})
user = User.create!({first_name: 'Manuel', last_name: 'Gausa'})
user.add_role :tutor, group
user = User.create!({first_name: 'Maite', last_name: 'Bravo'})
user.add_role :tutor, group
user = User.create!({first_name: 'Ricardo', last_name: 'Devesa'})
user.add_role :tutor, group

group = Course.create!({name: 'IC.4 Seminar', description: 'Digital Tools', parent: maa})
user = User.create!({first_name: 'Luis', last_name: 'Fraguada'})
user.add_role :tutor, group
user = User.where(first_name: 'Rodrigo').first
user.add_role :tutor, group

group = Course.create!({name: 'Transversal Workshop', description: 'Advanced Architecture Theory Intensive Workshop', parent: maa})
user = User.where(first_name: 'Manuel').first
user.add_role :tutor, group
user = User.create!({first_name: 'Mathilde', last_name: 'Marengo'})
user.add_role :tutor, group
user = User.create!({first_name: 'Maria', last_name: 'Kuptsova'})
user.add_role :tutor, group
user = User.create!({first_name: 'Jonathan', last_name: 'Minchin'})
user.add_role :tutor, group
