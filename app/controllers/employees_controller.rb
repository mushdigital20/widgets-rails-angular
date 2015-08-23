#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-16 00:26:45
# @Last Modified by:   Pedro Mello
# @Last Modified time: 2015-08-23 19:26:08

class EmployeesController < ApplicationController

	def show_location
		employees = Employee.details()["employees"]

		locations = {}

		#work around for locations, should come from the API
		coords = {
			"711a8571-0b31-0133-4ced-22000aac0203"=>{:center=>{:latitude=>37.7919615,:longitude=>-122.2287941},:name=>"Work Location 1"}
		}

		#counts the employees for each work location
		employees.each do |employee|
			employee["work_locations"].each do |work|
				work_id = work["id"]

				locations[work_id] = {
					:id=>work_id,
					:employee_count => 0,
					:employees => [],
					:center => coords[work_id][:center],
					:label => coords[work_id][:name],
					:color => {:color=>"\##{("%06x" % (rand * 0xffffff))}",:opacity=>0.7}, #Generates a random color for the graph
					:stroke =>{:color=>"transparent",:opacity=>0}
				} unless locations.has_key?(work_id)
				
				locations[work_id][:employee_count] += 1
				locations[work_id][:value] = locations[work_id][:employee_count]
				locations[work_id][:employees] << employee
			end
		end

		#format data for graph
		graph_data = []
		slices = []
		locations.values.each do |item|
			graph_data << {:c=>[{:v=>item[:label]},{:v=>item[:value]}]}
			slices << {:color=>item[:color][:color]}
		end

		result = {:map=>locations.values,:graph=>{:data=>graph_data,:slices=>slices}}

		render json: result.as_json()
	end
end