require "pry"
class Application

	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)
		if req.path.match(/item/)
			item = req.path.split("/item/").last
			# item_index = @@items.index(item)  change this to check object names
			binding.pry
			if !item_index
				resp.write @@items[item_index].price
				resp.status = 200
			else
				resp.write "Item not found"
				resp.status = 400
			end
		else
			resp.write "Route not found"
			resp.status = 404
		end
		resp.finish
	end
end