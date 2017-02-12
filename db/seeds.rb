require 'csv'

csv_text = File.read('members.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  member_record = row.to_hash
  member_record['birth_date'] = member_record['birth_date'].to_date
  db_record = Member.find_by(name: member_record['name'])
  if db_record.nil?
    Member.create(member_record)
  else
    db_record.update(name: member_record['name'],
                     gender: member_record['gender'],
                     birth_date: member_record['birth_date'],
                     phone_number: member_record['phone_number'],
                     email: member_record['email'])
  end
end

@members = Member.all
@members.each do |x|
  if x.updated_at.to_date < Date.today
    x.update(current: false)
  else
    x.update(current: true)
  end
end
