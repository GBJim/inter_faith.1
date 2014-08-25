namespace :dev  do
	
	desc "Build the religious"
	task :buildReligion => :environment do

		religiousList = ["Buddhism","Christianity","Hinduism","Islam","Other"]
		religiousList.each do |religion_name|
			religion = Religion.new
			religion.name = religion_name
			religion.save
		end
	end

end