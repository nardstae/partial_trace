require "partial_trace/version"

module PartialTrace
  def render(*args)
    if self.source and self.identifier
      file = self.identifier.sub "#{Rails.root}/", ""
      self.source.insert(0, "<!-- TEMPLATE BEGIN: #{file} //-->\n")
      self.source.insert(-1, "<!-- TEMPLATE END: #{file} //-->\n")
    end
    super(*args)
  end
end

ActionView::Template.prepend(PartialTrace)
