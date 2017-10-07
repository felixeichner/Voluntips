module ApplicationHelper

	def admin_links(object = "", edit_path = "")
		if logged_in?(:admin)
			unless object == ""
				(link_to 'Bearbeiten', edit_path, class: "btn btn-designed") + ' ' +
				(link_to 'Löschen', object,
														method: :delete,
														data: { confirm: 'Are you sure?' }, class: "btn btn-designed")
			end
		end
	
	end

	def filter_button_helper(label, terrain)
		link_to label, projects_path('', :terrain => terrain),
						class: "btn btn-designed btn-filter #{active?(@session_params['terrain'], terrain)}"
	end

  def active?(key, value)
  	"active" if key == value
  end

	def current_action_label
		if action_name == "new"
			"Erstellen"
		else
			"Ändern"
		end
	end

end
