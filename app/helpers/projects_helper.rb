module ProjectsHelper
	def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}", style: "white-space: nowrap;"
  end

  def google_maps_helper
		if @project.lat? && @project.lgt?
			(@project.lat + "," + @project.lgt + "&center=" + (@project.lat.to_i+6).to_s + "," + @project.lgt)
		else
			@project.address.gsub(/\s/, '+')
		end
  end

  def terrain_selection_helper
		if @session_params.has_key?('terrain')
      if @session_params.has_value?('Land')
      	terrain_result = "Tiere an Land"
      elsif @session_params.has_value?('Wasser')
      	terrain_result = "Tiere im Wasser"
      elsif @session_params.has_value?('Luft')
      	terrain_result = "Tiere in der Luft"
      elsif @session_params.has_value?('Landschaft')
      	terrain_result = "Landschaft und Flora"
      end
      content_tag(:strong, "Schwerpunktthema: ") + terrain_result
		end
  end

  def animal_selection_helper
  	if @session_params.has_key?('animal')
  		content_tag(:strong, "Schwerpunktthema: ") + @session_params["animal"]
		end
  end

  def region_selection_helper
  	if @session_params.has_key?('region')
  		content_tag(:strong, "Region: ") + @session_params["region"]
		end
  end

  def country_selection_helper
  	if @session_params.has_key?('country')
  		content_tag(:strong, "Land: ") + @session_params["country"]
		end
  end

  def animals_selection_helper
  	if @session_params.has_key?('animal_ids')
  		content_tag(:strong, "Tiere/Landschaftsformen: ") + @selected_animals.join(', ')
  	end
  end

  def terrains_selection_helper
  	if @session_params.has_key?('terrain_ids')
  		content_tag(:strong, "Terrains: ") + @selected_terrains.join(', ')
  	end
  end

  def regions_selection_helper
  	if @session_params.has_key?('region_ids')
  		content_tag(:strong, "Regionen: ") + @selected_regions.join(', ')
  	end
  end

  def countries_selection_helper
  	if @session_params.has_key?('country_ids')
  		content_tag(:strong, "Länder: ") + @selected_countries.join(', ')
  	end
  end

  def tasks_selection_helper
  	if @session_params.has_key?('task_ids')
  		content_tag(:strong, "Arbeitsmerkmale: ") + @selected_tasks.join(', ')
  	end
  end

  def accoms_selection_helper
  	if @session_params.has_key?('accom_ids')
  		content_tag(:strong, "Unterbringungsmerkmale: ") + @selected_accoms.join(', ')
  	end
  end

  def accom_stand_selection_helper
  	if @session_params.has_key?('accom_standards')
  		content_tag(:strong, "Unterbringungsstandard: ") + @selected_accom_standards.join(', ')
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
  		content_tag(:strong, "Kosten") + " bis zu " + @session_params['costs_week'] + " EUR pro Woche"
		end
	end

  def no_projekt_found_helper
  	if @proj_ids == []
  		message1 = "Uups! Zu den angegebenen Kriterien wurden keine passenden Projekte gefunden."
  		message2 = "Einfach mal weniger oder andere Kriterien ausprobieren, dann wirst du sicher fündig!"
  		content_tag(:strong, message1) + "<br>".html_safe + content_tag(:strong, message2)
  	end
  end
end
