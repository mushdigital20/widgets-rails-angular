#!/usr/bin/ruby
# @Author: pedromello
# @Date:   2015-08-15 16:27:34
# @Last Modified by:   pedromello
# @Last Modified time: 2015-08-18 22:04:14
# 
class Invoice

	#Invoices list endpoint
	def self.list(entity)		
		
		result = Impac.instance.get('invoices/list',{:entity=>entity})

		result['content']
	end
end