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

  def active?(key, value)
  	"active" if (key.nil? && value.nil? &&
  							 @session_params == {"controller"=>"projects", "action"=>"index"}) ||
  							 (!key.nil? && key.include?(value))
  end

	def current_action_label
		if action_name == "new"
			"Erstellen"
		else
			"Ändern"
		end
	end

end
