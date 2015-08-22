#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-15 16:27:34
# @Last Modified by:   pedromello
# @Last Modified time: 2015-08-19 09:55:26
# 
class Employee

	#Employees list endpoint
	def self.list
		Impac.instance.get('hr/employees_list')['content']
	end

	#Employee details endpoint
	def self.details
		Impac.instance.get('hr/employee_details')['content']
	end
end