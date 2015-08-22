#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-16 00:26:45
# @Last Modified by:   pedromello
# @Last Modified time: 2015-08-19 09:57:36

class EmployeesController < ApplicationController

	def show_location
		employees = Employee.list()
		raise employees.inspect

		#groups all invoices by City
		grouped_by_city = employees.group_by {|item| item["address"]["l"]}
		

		grouped_by_city.each do |city,info|

			#iterates all the entities
			info.each do |entity|
				#country the city belongs to 
				country = entity["address"]["c"]
				#start hash for the city if not present
				total_sales[city] = {
					:total_invoiced => 0,
					:total_paid => 0,
					:total_due => 0,
				 	:country=>country} unless total_sales.has_key?(city)

				#sums the totals
				total_sales[city][:total_invoiced] += entity["total_invoiced"].to_f
				total_sales[city][:total_paid] += entity["total_paid"].to_f
				total_sales[city][:total_due] += entity["total_due"].to_f
			end
		end

		#sort hash by total invoiced amount
		b = total_sales.sort_by { |k, v| v[:total_invoiced] }.reverse
		
		render json: entities.as_json()
	end
end