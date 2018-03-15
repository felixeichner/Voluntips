module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Voluntips | Freiwilligenarbeit im Natur- und Tierschutz"
		@seo_keywords = "Freiwilligenarbeit Volunteering Naturschutz Tierschutz
										Projekte mitarbeiten helfen unterstützen"
	end

	def set_show_keywords
		@seo_keywords = (@project.title + " " + @project.preview + "Freiwilligenarbeit Tierschutz").remove(
										",", "und ", "pflegen", "studieren", "retten", "erforschen", "schützen", "aufziehen",
										"ihre", "heimischen", "zum", "Verhalten", "von", "aufforsten", "bewahren",
										"beobachten", "heimische", "Afrikanische", "großziehen")
	end		
end