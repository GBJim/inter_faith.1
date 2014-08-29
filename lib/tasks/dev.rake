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


	desc "Lorem ipsum"
	task :seed => :environment do

		50.times { |i| x = Post.create(title: "Post #{i}", body: BetterLorem.p(20, false, false), user_id:  User.first.id)

						 }




	end

end