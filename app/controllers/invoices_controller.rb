#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-16 00:25:45
# @Last Modified by:   pedromello
# @Last Modified time: 2015-08-23 00:41:19

class InvoicesController < ApplicationController

	def sales_flow()

		response = Invoice.list('customers')
		entities = response["entities"]

		#groups all invoices by City
		grouped_by_city = entities.group_by {|item| item["address"]["l"]}
		total_sales = {}

		#work around for locations, should come from the API
		coords = {
			"-"=>{:lat=>nil,:lon=>nil},
			"Oaktown"=>{:lat=>37.7919615,:lon=>-122.2287941},
			"Melbourne"=>{:lat=>-37.8602828,:lon=>145.079616},
			"San Francisco"=>{:lat=>37.7577,:lon=>-122.4376},
			"Pinehaven"=>{:lat=>37.9577411,:lon=>-122.0439648},
			"Sydney"=>{:lat=>-33.7969235,:lon=>150.9224326},
			"Half Moon Bay"=>{:lat=>37.4737838,:lon=>-122.4469839},
			"Melbourne GPO"=>{:lat=>-37.8137612,:lon=>144.9633347},
			"Ridge Heights"=>{:lat=>38.2672454,:lon=>-104.5908685}
		}

		grouped_by_city.each do |city,info|

			#iterates all the entities
			info.each do |entity|
				#country the city belongs to 
				country = entity["address"]["c"]
				#start hash for the city if not present
				color = "\##{("%06x" % (rand * 0xffffff))}"
				total_sales[city] = {
					:total_invoiced => 0,
					:total_paid => 0,
					:total_due => 0,
					:value => 0, #attribute for the graph
					:color => {:color=>color,:opacity=>0.7}, #Generates a random color for the graph
					:stroke => {:color=>color,:opacity=>0,:weight=>0},
				 	:country=>country,
				 	:label=>city,
				 	:center=>{:latitude=> coords[city][:lat],:longitude=> coords[city][:lon]},
				 	:visible=>city == '-' ? false : true
				 	} unless total_sales.has_key?(city)

				#sums the totals
				total_sales[city][:total_invoiced] += entity["total_invoiced"].to_f
				total_sales[city][:value] = total_sales[city][:total_invoiced]
				total_sales[city][:total_paid] += entity["total_paid"].to_f
				total_sales[city][:total_due] += entity["total_due"].to_f
			end
		end

		#sort hash by total invoiced amount
		map_data = []
		sorted_sales = total_sales.sort_by { |k, v| v[:total_invoiced] }.reverse
		
		#map the array to show only the hashes
		sorted_sales.map { |k, v|  map_data << v}

		#format data for graph
		graph_data = []
		slices = []
		map_data.each do |item|
			graph_data << {:c=>[{:v=>item[:label]},{:v=>item[:value]}]}
			slices << {:color=>item[:color][:color]}
		end

		result = {:map=>map_data,:graph=>{:data=>graph_data,:slices=>slices}}
		
		render json: result.as_json()
	end
end
