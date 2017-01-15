# lib/tasks/update_members.rake
namespace :members do
  desc "Update confirmed members"
  task update_members: :environment do
    members = Members.confirmed
    puts "Going to update #{members.count} members"

    ActiveRecord::Base.transaction do
      members.each do |member|
        member.mark_newsletter_received!
        print "."
      end
    end

    puts " All done now!"
  end
end
