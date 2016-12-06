User.create!(username: 'chloejchou')
User.create!(username: 'jennifertchou')

Contact.create!(name: 'Jodie', email: 'jodielchou@yahoo.com', owner_id: 1)
Contact.create!(name: 'Clement', email: 'ckmchou@yahoo.com', owner_id: 2)
Contact.create!(name: 'Marnie', email: 'marnie@gmail.com', owner_id: 3)

ContactShare.create!(contact_id: 1, user_id: 2)
ContactShare.create!(contact_id: 2, user_id: 1)
