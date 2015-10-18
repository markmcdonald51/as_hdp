class SectionsController < ApplicationController
  layout 'sections' #, except: [:index]

  def index
    @sections = SiteSection.roots.order(:position)
  end

  def show
    @section = SiteSection.find(params[:id])
  end


  #def set_layout
  #    (@section && @section.layout.try(:rails_layout_name)) || 'application'
  #end

end
