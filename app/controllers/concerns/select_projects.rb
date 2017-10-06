module SelectProjects
  extend ActiveSupport::Concern

  included do
  	before_action :select_projects, only: [:index]
  end

  def select_projects
	  @session_params = {}

	  params.each do |k,v|
	    @session_params[k] = v unless (v.empty? || v.delete("") == v.blank? || v == [])
	  end

		@projects = Project.order_by_title

    if @session_params.has_key?('terrain')
			@projects = @projects.joins(:animals)
													 .where("animals.terrain = ?", @session_params['terrain'])
													 .uniq
    end
  end
end