module ApplicationHelper

	def admin_links(object, edit_path)
		(link_to 'Zurück', url_for(:back), class:'btn btn-sm btn-warning') + ' ' +
		(link_to 'Bearbeiten', edit_path, class: "btn btn-sm btn-warning") + ' ' +
		(link_to 'Löschen', object,
												method: :delete,
												data: { confirm: 'Are you sure?' }, class: "btn btn-sm btn-warning")
	end

  def active?(key, value)
  	"active" if key == value
  end

end
