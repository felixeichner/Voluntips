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
end
