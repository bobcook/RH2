require 'csv'

Member.update_all(current: false)

csv_text = File.read('members.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  member_record = row.to_hash
  member_record['birth_date'] = member_record['birth_date'].to_date
  db_record = Member.find_by(name: member_record['name'])
  if db_record.nil?
    Member.create(member_record, current: true, exempt: false)
  else
    db_record.update(name: member_record['name'],
                     gender: member_record['gender'],
                     birth_date: member_record['birth_date'],
                     phone_number: member_record['phone_number'],
                     email: member_record['email'],
                     current: true)
  end
end
