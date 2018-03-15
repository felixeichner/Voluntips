module SelectProjects
  extend ActiveSupport::Concern

  included do
  	before_action :select_projects, only: [:index]
  end

  def select_projects
	  @projects_all = Project.all
	  @session_params = {}
	  @animals = Animal.all
	  @countries = Country.all
	  @tasks = Task.all
	  @accoms = Accom.all

	  params.each do |k,v|
	    @session_params[k] = v unless (v.empty? || v.delete("") == v.blank? || v == [])
	  end

		@projects = Project.order_by_title
    
		filter_check("terrains", :animals, "terrain")
		filter_check("animals", :animals, "name")
		filter_check("countries", :countries, "name")
		filter_check("tasks", :tasks, "name")
		filter_check("accoms", :accoms, "name")
		filter_check("accom_standards", "accom_standard")

	  filter_check_nums("min_weeks")
	  filter_check_nums("costs_week")

    if @session_params.has_key?('regions')
   		@projects = @projects.joins(:countries)
   												 .where({"countries.region1" => @session_params['regions']})
   												 .or(@projects.joins(:countries)
   												 .where({"countries.region2" => @session_params['regions']}))
   												 .distinct
	  end

  end

	def filter_check(key, join = "", column)
		if @session_params.has_key?(key)
			@projects = @projects.joins(join)
													 .where({"#{join.to_s+"." unless join == ""}#{column}" =>
													 	@session_params[key]})
													 .distinct
		end
	end

	def filter_check_nums(value)
		if @session_params.has_key?(value)
	  	@projects.where!("#{value} <= ?", @session_params[value].to_i)
	  end
	end
end