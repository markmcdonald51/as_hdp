class Admin::LayoutsController < Admin::Auth

  columns = [:name, :description, :rails_layout_name, :sample_url, :layout_partials, :aasm_string]
  active_scaffold :"layout" do |config|
    config.columns = columns
    #config.columns.exclude(:parent, :created_at, :updated_at)
    config.create.columns = columns - [:aasm_string]
    config.update.columns = columns - [:aasm_string]
  end

end
