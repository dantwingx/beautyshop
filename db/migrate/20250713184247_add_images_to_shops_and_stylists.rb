class AddImagesToShopsAndStylists < ActiveRecord::Migration[8.0]
  def change
    add_column :shops, :image_urls, :text, array: true, default: [] unless column_exists?(:shops, :image_urls)
  end
end