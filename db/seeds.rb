# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read('members.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  member_record = row.to_hash
  member_record['birth_date'] = member_record['birth_date'].to_date
  db_record = Member.where(name: member_record['name'])
  if db_record == []
    Member.create(member_record)
  else
    Member.update(db_record, current: true)
  end
end

@members = Member.all
@members.each do |x|
  if x.updated_at < Date.today
    x.current = false
  else
    x.current = true
  end
  x.save
end
