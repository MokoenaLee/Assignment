#!/usr/bin/env ruby

#rest client documentation found at: https://github.com/rest-client/rest-client

require 'rest-client' 

class Assignment
	#static method of the class
	def self.get_course_details
		get_response = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})
		puts "=======Course Details==========================="
		puts "Response Code: #{get_response.code}"
		puts get_response.body
	end


	def self.change_course_name(course_name)
		put_response = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760',
                                             payload: {"course[name]" => "#{course_name}"},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})
		
		puts "=======Course with Updated Name==========================="

		puts " Updated course name is #{put_response.body}"
	end



	def self.get_course_settings
		get_course_settings = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760/settings', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})
		puts "========Course Settings========================================================"
		puts "Course settings:  #{get_course_settings.body}"
	end



	def self.restrict_student_discussion
		put_changeSettings = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760/settings',
                                             payload: {"allow_student_discussion_topics" => false, "allow_student_discussion_editing" => true},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})
		puts "=========Updated to not allow student_discussion==============="
		
		puts "changed settings #{put_changeSettings}"

	end


end


Assignment.get_course_details

Assignment.get_course_settings

Assignment.change_course_name(ARGV[0])

Assignment.restrict_student_discussion







=begin 
base url is https://canvas.instructure.com and since  going through the api,
added to this is the api doumentation format for a specific course
=end 

#= begin 
#fetch existing course










#body_response = response.body

#= end 
=begin
 Update the course name

=end 







=begin
 view the course settings

=end 






