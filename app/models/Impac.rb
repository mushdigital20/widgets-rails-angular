#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-15 16:27:34
# @Last Modified by:   pedromello
# @Last Modified time: 2015-08-16 00:15:30
# 
# Impac! API - HTTParty wrapper
# Singleton Pattern

class Impac
	include HTTParty
	base_uri ENV['impac_url']

	#Returns a hash with the API's credentials
	def initialize
		@auth = {
			:username=>ENV['impac_username'], 
			:password=>ENV['impac_password']
		}
	end

	#Creates singleton instance
	@@instance = Impac.new

	#returns the object instance
	def self.instance
    	return @@instance
  	end

  	#Executes GET request
	def get(engine,metadata={})
		
		metadata.merge!({:organization_ids => [ENV['impac_organization']]})

		options = {
			:basic_auth => @auth,
			:query => {
				:engine => engine,
				:metadata => metadata
			},
			:verify => false #SSL verify
		}

    	self.class.get('', options)
	end
end