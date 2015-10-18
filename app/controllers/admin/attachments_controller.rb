class Admin::AttachmentsController < ApplicationController
  active_scaffold :"attachment" do |config|

    #config.columns.exclude(:asset_updated_at, :created_at, :updated_at,
    # :asset_content_type, :asset_file_name, :asset_file_size)

    config.columns = [:asset, :summary]
    config.create.columns = [:asset, :summary, :usage]
    config.update.columns = [:asset, :summary, :usage]
    config.list.columns = [:asset, :summary]
    config.columns[:usage].form_ui = :hidden

    config.actions << :sortable
    config.sortable.column = :position
  end


end
