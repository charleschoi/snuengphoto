class Photo < ActiveRecord::Base
  attr_accessible :description, :photo_abc, :photo_real_name, :photo_saved_name, :title, :user_id, :when, :where
  belongs_to :user

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end
end
