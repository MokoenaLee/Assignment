#!/usr/bin/env ruby

#rest client documentation found at: https://github.com/rest-client/rest-client

require 'rest-client' 

require 'json'


=begin
	This script enables the authorized user(Teacher) 
	to change the course name by calling on the api and change the course settings
	the methods are ordered to reflect the thought process of how I was able to make these changes
	Can be commented out using =begin =end block
	
=end
class Assignment

	
	def self.get_course_details
		get_response = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})
		
		if get_response.code == 200	
			puts "==COURSE NAME: "
			json_parsed  = JSON.parse(get_response.body)
			puts "COURSE NAME => #{json_parsed["name"]}"
			puts "=======Course Details==========================="
			puts get_response.body	
		else
			return 0
		end
		
	end


	def self.change_course_name(course_name)
		put_response = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760',
                                             payload: {"course[name]" => "#{course_name}"},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})
		
		if put_response.code == 200	|| 204
			json_parsed  = JSON.parse(put_response.body)
			puts "COURSE NAME =>  #{json_parsed["name"]}"
			puts "=======Course with Updated Name==========================="
			puts put_response.body
				
		else
			return 0
		end
		
	end



	def self.get_course_settings
		get_course_settings = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760/settings', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})
		
		if  get_course_settings.code == 200	
			puts "========Course Settings========================================================"
			puts get_course_settings.body		
		else
			return 0
		end
		
	end



	def self.restrict_student_discussion
		put_changeSettings = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760/settings',
                                             payload: {"allow_student_discussion_topics" => false, "allow_student_discussion_editing" => true},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})
		if  put_changeSettings.code == 200	|| 204
			puts "=========Updated to not allow student_discussion==============="
			json_parsed  = JSON.parse(put_changeSettings.body)
			puts "allow_student_discussion_topics =>  #{json_parsed["allow_student_discussion_topics"] }"
			puts put_changeSettings		
		else
			return 0
		end

	end


end


Assignment.get_course_details

Assignment.get_course_settings

Assignment.change_course_name(ARGV[0])

Assignment.restrict_student_discussion












 






