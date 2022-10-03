# Person Profile seed data
person_1 = PersonProfile.create(role_holder_name: 'Test Person 1', subtype: 'academic_profile', pure_portal_url: 'https://researchportal.bath.ac.uk/example')
person_2 = PersonProfile.create(role_holder_name: 'Test Person 2', subtype: 'academic_profile', pure_portal_url: 'https://researchportal.bath.ac.uk/example')

academic_team = TeamProfile.find_or_create_by(title: 'Test team 1', subtype: 'academic_team')
leadership_team = TeamProfile.find_or_create_by(title: 'Test team 2', subtype: 'leadership_team')

academic_team.person_profiles << [person_1, person_2]
leadership_team.person_profiles << [person_1, person_2]
