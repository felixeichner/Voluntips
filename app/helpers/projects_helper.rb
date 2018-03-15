module ProjectsHelper
	def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}", style: "white-space: nowrap;"
  end

  def google_maps_helper
		if @project.lat? && @project.lgt?
			(@project.lat + "," + @project.lgt + "&center=" +
				(@project.lat.to_i+6).to_s + "," + @project.lgt)
		else
			@project.address.gsub(/\s/, '+')
		end
  end

	def filter_button_helper(label, terrain)
		link_to label, projects_path('', :terrains => [terrain]),
						class: "btn btn-designed btn-filter #{active?(@session_params['terrains'], terrain)}"
	end

	def select_headline_helper(key, headline)
		if @session_params.has_key?(key)
			content_tag(:strong, headline+": ") + @session_params[key].join(', ')
		end
	end  	

  def min_weeks_selection_helper
		if @session_params.has_key?('min_weeks')
  		content_tag(:strong, "Aufenthalt") + " bis zu " + @session_params['min_weeks'] +
  		(if @session_params['min_weeks'] == '1' then ' Woche' else ' Wochen' end)
		end
	end

  def costs_week_selection_helper
		if @session_params.has_key?('costs_week')
  		content_tag(:strong, "Kosten") + " bis zu " +
  								@session_params['costs_week'] + " EUR pro Woche"
		end
	end

  def no_project_found_helper
  	if @projects.none?
  		message1 = "Uups! Zu den angegebenen Kriterien wurden keine passenden Projekte gefunden."
  		message2 = "Einfach mal weniger oder andere Kriterien ausprobieren,
  								dann wirst du sicher fündig!"
  		"<hr>".html_safe + content_tag(:strong, message1) +
  		"<br>".html_safe + content_tag(:strong, message2)
  	end
  end
end
