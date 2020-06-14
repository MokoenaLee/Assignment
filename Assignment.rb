
require 'rest-client'

#rest client documentation found at: https://github.com/rest-client/rest-client




=begin 
base url is https://canvas.instructure.com and since  going through the api,
added to this is the api doumentation format for a specific course
=end 

#= begin 
#fetch existing course

get_response = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})


puts "Response Code: #{get_response.code}"

#response of request returned in the body

puts get_response.body








#body_response = response.body

#= end 
=begin
 Update the course name

=end 


put_response = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760',
                                             payload: {"course[name]" => "Creative Writing"},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})
puts " Updated course name is #{put_response}"




=begin
 view the course settings

=end 

get_course_settings = RestClient.get('https://canvas.instructure.com/api/v1/courses/2106760/settings', {:Authorization => 'Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq'})

puts "=============================================================================================================="

puts "course settings #{get_course_settings.body}"


puts "==================================editing settings changed======================================================"

put_changeSettings = RestClient::Request.execute(method: :put,
                                             url: 'https://canvas.instructure.com/api/v1/courses/2106760/settings',
                                             payload: {"allow_student_discussion_topics" => false, "allow_student_discussion_editing" => true},
                                             headers: {"Authorization" => "Bearer 7~Ic2qTMmcJF3ci6LCGvf4Iw04XYdvKjeokVZzvsHOtJ1ppSLtXDLPo7bvacNC8XVq"})

puts "changed settings #{put_changeSettings}"




