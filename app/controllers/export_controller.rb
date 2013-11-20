class ExportController < ApplicationController
  def index
		@products = Photo.all
		respond_to do |format|
			format.html
			format.csv { send_data @products.to_csv }
			format.xls # { send_data @products.to_csv(col_sep: "\t") }
		end
	end
	def download
	end
end
