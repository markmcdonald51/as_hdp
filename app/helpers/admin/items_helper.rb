module Admin::ItemsHelper

  # creates a popup link to page link
#def item_title_column(record, column)
#  link_to(h(record.title), item_url(record), target: "_blank")
#end

def item_summary_column(record, column)
  truncate(record.summary.html_safe, length: 90, escape: false) if record.try(:summary)
end

def item_image_column(record, column)
  asset_column(record.image, column) unless record.image.blank?
  #image_tag record.image.asset.url(:thumb)
end

def truncate_summary(r, length = 300)
  r.sub!(/^<p>/i, '')
  r.sub!(/<\/p>$/i, '')
  truncate(r, length: length, escape: false)
end



  def active_scaffold_grouped_options(column, select_options, optgroup)
    new_select_options = []

    Category.roots.each do |r|
      ary = []
      found_children = false

      r.children.each do |c1|
        if c1.children.present?
          found_children = true
          c1.children.map {|child| ary << ["#{child.parent.name} -> #{child.name}", child.id]}
        else
          ary << ["#{c1.name}", c1.id ]
        end
      end
      new_select_options << [r.name, ary]
    end
    return  new_select_options #, [@record.categories.pluck(:id)]
  end
end
